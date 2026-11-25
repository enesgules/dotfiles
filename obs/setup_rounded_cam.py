# Lays out both scenes and rounds the corner cam with a mask. Run with OBS closed.
# The corner cam is a square nested scene ("cam pip"): filters run before scene-item crop, so the mask
# goes on the nested scene to round the cropped square. The full cam overscans and needs no mask.
# Both scenes keep a negative X scale (mirror), so the Move transition never flips the camera.
import copy, json, math, os, struct, uuid, zlib

W, H = 2560, 1440          # OBS canvas
CW, CH = 1920, 1080        # camera resolution
S = CH                     # corner cam square side in camera px (sides cropped)
PIP, MARGIN = 0.4, 64      # corner cam = 432x432, 64px from top/right edges
R = 55                     # corner radius in camera px (~22px in the corner cam)
FULL = (H + 60) / CH       # full cam overscans 30px+ per side so its corners stay off-screen
PIP_SCENE = "cam pip"
MASK = os.path.join(os.path.dirname(os.path.abspath(__file__)), "cam-rounded-mask.png")
SCENES = os.path.expanduser("~/Library/Application Support/obs-studio/basic/scenes/Untitled.json")

def alpha(x, y):
    cx = R if x < R else S - R if x >= S - R else None
    cy = R if y < R else S - R if y >= S - R else None
    if cx is None or cy is None: return 255
    return round(255 * min(1, max(0, R + 0.5 - math.hypot(x + 0.5 - cx, y + 0.5 - cy))))

rows = [b"\0" + b"".join(struct.pack("4B", 255, 255, 255, alpha(x, y)) for x in range(S)) for y in range(S)]
def chunk(t, data): return struct.pack(">I", len(data)) + t + data + struct.pack(">I", zlib.crc32(t + data))
open(MASK, "wb").write(b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", S, S, 8, 6, 0, 0, 0))
                       + chunk(b"IDAT", zlib.compress(b"".join(rows), 9)) + chunk(b"IEND", b""))

d = json.load(open(SCENES))
d["sources"] = [s for s in d["sources"] if s["name"] != PIP_SCENE]
src = {s["name"]: s for s in d["sources"]}
cam = src["cam"]
cam["filters"] = []
template = copy.deepcopy(next(i for i in src["full cam"]["settings"]["items"] if i["name"] == "cam"))

def item(source, item_id, pos, scale, ref, crop=0):
    # Relative values are against the parent scene size (ref); with a negative X scale, pos.x is the right edge.
    (x, y), (rw, rh) = pos, ref
    i = copy.deepcopy(template)
    i.update(name=source["name"], source_uuid=source["uuid"], id=item_id, align=5, bounds_type=0,
             crop_left=crop, crop_right=crop, crop_top=0, crop_bottom=0, scale_ref={"x": rw, "y": rh},
             pos={"x": x, "y": y}, pos_rel={"x": (x - rw / 2) / (rh / 2), "y": (y - rh / 2) / (rh / 2)},
             scale={"x": scale[0], "y": scale[1]}, scale_rel={"x": scale[0], "y": scale[1]},
             bounds={"x": 0.0, "y": 0.0}, bounds_rel={"x": 0.0, "y": 0.0}, scale_filter="bicubic")
    return i

pip = copy.deepcopy(src["screen + cam"])
pip.update(name=PIP_SCENE, uuid=str(uuid.uuid4()), hotkeys={},
           settings={"id_counter": 1, "custom_size": True, "cx": S, "cy": S,
                     "items": [item(cam, 1, (S, 0), (-1, 1), (S, S), crop=(CW - S) // 2)]},
           filters=[{"name": "Rounded corners", "uuid": str(uuid.uuid4()), "id": "mask_filter",
                     "versioned_id": "mask_filter_v2", "enabled": True,
                     "settings": {"type": "mask_alpha_filter.effect", "image_path": MASK}}])
d["sources"].append(pip)

src["full cam"]["settings"]["items"] = [item(cam, 1, ((W + CW * FULL) / 2, (H - CH * FULL) / 2), (-FULL, FULL), (W, H))]
screen = src["screen + cam"]["settings"]
screen["items"] = [i for i in screen["items"] if i["name"] not in ("cam", PIP_SCENE)]
screen["items"].append(item(pip, screen["id_counter"], (W - MARGIN - S * PIP, MARGIN), (PIP, PIP), (W, H)))

# Move matches "cam" inside the nested scene, so the camera still glides between both scenes.
next(t for t in d["transitions"] if t["id"] == "move_transition")["settings"]["nested_scenes"] = True

json.dump(d, open(SCENES, "w"), indent=4)
print("ok")
