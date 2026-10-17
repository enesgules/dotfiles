# Rounds the camera corners with a mask on the "cam" source and lays out both scenes. Run with OBS closed.
# Both scenes keep a negative X scale (mirror), so the Move transition never flips the camera.
import json, math, os, struct, uuid, zlib

W, H = 2560, 1440          # OBS canvas
CW, CH = 1920, 1080        # camera resolution
R = 66                     # corner radius in camera px (~22px in the corner cam)
PIP, MARGIN = 1 / 3, 40    # corner cam = 640x360, 40px from top/right edges
FULL = (H + 60) / CH       # full cam overscans 30px+ per side so the rounded corners stay off-screen
MASK = os.path.join(os.path.dirname(os.path.abspath(__file__)), "cam-rounded-mask.png")
SCENES = os.path.expanduser("~/Library/Application Support/obs-studio/basic/scenes/Untitled.json")

def alpha(x, y):
    cx = R if x < R else CW - R if x >= CW - R else None
    cy = R if y < R else CH - R if y >= CH - R else None
    if cx is None or cy is None: return 255
    return round(255 * min(1, max(0, R + 0.5 - math.hypot(x + 0.5 - cx, y + 0.5 - cy))))

rows = [b"\0" + b"".join(struct.pack("4B", 255, 255, 255, alpha(x, y)) for x in range(CW)) for y in range(CH)]
def chunk(t, data): return struct.pack(">I", len(data)) + t + data + struct.pack(">I", zlib.crc32(t + data))
open(MASK, "wb").write(b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", CW, CH, 8, 6, 0, 0, 0))
                       + chunk(b"IDAT", zlib.compress(b"".join(rows), 9)) + chunk(b"IEND", b""))

d = json.load(open(SCENES))
src = {s["name"]: s for s in d["sources"]}
cam = src["cam"]
cam["filters"] = [{"name": "Rounded corners", "uuid": str(uuid.uuid4()), "id": "mask_filter",
                   "versioned_id": "mask_filter_v2", "enabled": True,
                   "settings": {"type": "mask_alpha_filter.effect", "image_path": MASK}}]

def place(scene, scale, right, top):
    # With a negative X scale, pos.x is the right edge of the mirrored image.
    item = next(i for i in src[scene]["settings"]["items"] if i["name"] == "cam")
    item.update(name="cam", source_uuid=cam["uuid"], align=5, bounds_type=0,
                crop_left=0, crop_right=0, crop_top=0, crop_bottom=0,
                pos={"x": right, "y": top}, pos_rel={"x": (right - W / 2) / (H / 2), "y": (top - H / 2) / (H / 2)},
                scale={"x": -scale, "y": scale}, scale_rel={"x": -scale, "y": scale},
                bounds={"x": 0.0, "y": 0.0}, bounds_rel={"x": 0.0, "y": 0.0}, scale_filter="bicubic")

place("full cam", FULL, (W + CW * FULL) / 2, (H - CH * FULL) / 2)
place("screen + cam", PIP, W - MARGIN, MARGIN)

json.dump(d, open(SCENES, "w"), indent=4)
print("ok")
