# Filippo Valsorda (FiloSottile): security reviewer research

Research date: 2026-10-30. Window: weighted to Nov 2025 to Oct 2026. Older canonical posts are used only where they still drive his current reviews.

Method:
- GitHub (gh CLI): 60 PRs he reviewed, 60+ issue threads he commented on, 40 recent commits, 3 security advisories. Comments read in full on about 25 threads (golang/go, FiloSottile/age, C2SP/C2SP, C2SP/wycheproof, hpkewg/hpke, FiloSottile/passkey, galadran/we-have-a-problem.com).
- Gerrit (go-review.googlesource.com REST API): 120 CLs he reviewed after 2025-11-01. 38 substantive inline comments from 12 CLs (go, crypto, mod repos). The `/messages` endpoint failed, so only inline comments were sampled.
- Blog: 25 posts downloaded from words.filippo.io, plus filippo.io/maintenance and the Go Cryptography Principles.
- Verification: each quote below was checked by a fixed-string grep against the fetched text or the API output. Quotes are verbatim. Curly apostrophes come from the blog source.
- "Inference" marks anything I conclude that he did not say.

---

## 1. Current focus (what he works on now)

He leads Geomys, a firm of professional Go maintainers. He co-maintains the Go `crypto/...` and `golang.org/x/crypto/...` packages. He is no longer Go Security lead: "A role I passed on to capable hands when I left Google" ([vuln-reports, 2026-06-23](https://words.filippo.io/vuln-reports/)). In 2026, Geomys is funded by Ava Labs, Teleport, Datadog, Tailscale, and Sentry (same post).

Active work, newest first:

| Date | Work | Evidence |
|---|---|---|
| 2026-10-26 | Proposal `crypto/cobblestone`: chunked (streaming) AEAD encryption | [golang/go#82535](https://github.com/golang/go/issues/82535) |
| 2026-10-23 | Proposal `crypto/aead/...`: new high-level AEAD API that generates nonces for the caller | [golang/go#82456](https://github.com/golang/go/issues/82456) |
| 2026-10-14 | `cobblestone.ts`: TypeScript implementation of Cobblestone-128 (npm) | [FiloSottile/cobblestone.ts](https://github.com/FiloSottile/cobblestone.ts) |
| 2026-10-19 to 22 | Incident response to the eMudhra intermediate CA key compromise. Go x509 block (CVE), Sunlight "block known SPKIs by default", commits to the workaround site | [golang/go#82345](https://github.com/golang/go/issues/82345#issuecomment-6294844223), [sunlight aeba583b](https://github.com/FiloSottile/sunlight/commit/aeba583bcb3ebf1016b8a09ead89255d99dc9449), [we-have-a-problem.com](https://emudhra.we-have-a-problem.com/) |
| 2026-10-16 | NIST curve seeds bounty claimed (seeds came from `drand48`) | [seeds-solved](https://words.filippo.io/seeds-solved/) |
| 2026-10-12 | "(Post-Quantum) Cryptographic Right Answers" | [right-answers](https://words.filippo.io/right-answers/) |
| 2026-07-31 to 10-26 | Proposal `crypto/passkey`, implementation at filippo.io/passkey, spec c2sp.org/passkey-record | [golang/go#80663](https://github.com/golang/go/issues/80663), [passkey-record](https://words.filippo.io/passkey-record/), [passkey commits](https://github.com/FiloSottile/passkey/commit/7f1a37199ee0a24ef3f3674113809c4031f906f2) |
| 2026-09 | TLS "Profiles" design, so users do not configure each knob | [golang/go#79043](https://github.com/golang/go/issues/79043#issuecomment-5623975969) |
| 2026-09 to 10 | ML-DSA in x/crypto/ssh, ML-DSA cosignatures for the Go sumdb | [CL 819920](https://go-review.googlesource.com/c/crypto/+/819920), [CL 847066](https://go-review.googlesource.com/c/mod/+/847066) |
| 2026 (ongoing) | Transparency logs: Sunlight, torchwood, C2SP tlog specs, Merkle Tree Certificates (IETF PLANTS reviewer), geomys/magnolia, geomys/ct-archive | [C2SP PRs](https://github.com/C2SP/C2SP/pulls?q=reviewed-by%3AFiloSottile), [magnolia](https://github.com/geomys/magnolia) |
| 2026-05 to 10 | FIPS 140-3 Go Cryptographic Module (Wasm support, compliance fixes) | [CL 758441](https://go-review.googlesource.com/c/go/+/758441), [golang/go#82625](https://github.com/golang/go/issues/82625) |
| 2026-03 | Wycheproof ML-DSA edge-case vectors, made with mutation testing | [C2SP/wycheproof#225](https://github.com/C2SP/wycheproof/pull/225#issuecomment-4097291249) |
| 2026-04-06 | Public change of mind: the PQ migration must finish by 2029 | [crqc-timeline](https://words.filippo.io/crqc-timeline/) |
| 2026-02 | Supply chain posts: "Turn Dependabot Off", "Inspecting the Source of Go Modules", "go.sum Is Not a Lockfile" | [dependabot](https://words.filippo.io/dependabot/), [go-source](https://words.filippo.io/go-source/), [gosum](https://words.filippo.io/gosum/) |

Inference: geomys/magnolia ports the Sunlight sequencer and gets "subtree signatures for the issuance log". This suggests that it is Merkle Tree Certificate issuance infrastructure. The repo has no description.

He uses LLMs in review. He recommends "Get a review from the best model you can afford" ([right-answers](https://words.filippo.io/right-answers/)). He offers his agent account in reviews ("Want me to point @filippo-claude at it?", [wycheproof#254](https://github.com/C2SP/wycheproof/pull/254#discussion_r3477735539)). He also says that LLM output gets full human review: "This extends to any code generated with LLMs, as well." ([standard-of-care](https://words.filippo.io/standard-of-care/)).

---

## 2. Core values

1. **Safe by default. Unsafe use must be explicit.** His design doc ranks secure, then safe, then practical, then modern. "The goal is to make the libraries easy—not just possible—to use securely, as library misuse is just as dangerous to applications as vulnerabilities." ([Cryptography Principles](https://go.dev/design/cryptography-principles)). Also: "unsafe functionality, if at all available, should require explicit acknowledgement in the API." (same). The 2025 talk has the same idea: "so as long as you don't turn it off, we will default to post-quantum." ([2025-state](https://words.filippo.io/2025-state/)).

2. **The library carries the burden, not the user.** "We don't like blaming the application or the user when things go wrong." ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5386485086)). He changed the passkey API so that "there is no way to accidentally trust unverified information in the response" ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5386730057)).

3. **Remove knobs. Solve concrete, common needs.** "That's just not how we operate: we try to remove knobs, and instead identify common, concrete requirements to address effectively without dumping work on every user." ([#81228](https://github.com/golang/go/issues/81228#issuecomment-5464334284)). "Approximately no one wants to specifically configure the fifteen different knobs of a TLS library." ([2025-state](https://words.filippo.io/2025-state/)).

4. **Strict, canonical parsing at trust boundaries.** "when you can, always prefer reconstructing a value rather than parsing and validating it." ([reconstruct-vs-validate](https://words.filippo.io/reconstruct-vs-validate/)). In 2026: "In public keys it feels like trailing DER is much more likely to cause trouble than to help." ([#79860](https://github.com/golang/go/issues/79860#issuecomment-5653016962)).

5. **Use a concrete, proportional threat model, and decide on behalf of users.** He asks for the exact attack path ("Can you walk me through how that attack works against e.g. iCloud Keychain?", [#80663](https://github.com/golang/go/issues/80663#issuecomment-5321051842)). He rejects weak threat models ("This threat model I am a lot less concerned about, to be honest.", [#80663](https://github.com/golang/go/issues/80663#issuecomment-5343462634)). He acts fast on credible threats: "Remember that you are betting with your users’ lives." ([crqc-timeline](https://words.filippo.io/crqc-timeline/)).

6. **Vulnerability signal over noise.** "False positive alerts are not only a waste of time, they also reduce security by causing alert fatigue" ([dependabot](https://words.filippo.io/dependabot/)). "My responsibility is making sure my projects are not affected by security vulnerabilities." ([maintenance](https://filippo.io/maintenance)).

7. **Supply chain is a professional duty.** Phishing-resistant auth, no long-lived credentials, no privileged CI triggers, pinning. "It works against technical open source maintainers. It works against 2FA TOTP. It. Works." ([compromise-survey](https://words.filippo.io/compromise-survey/)).

8. **Less complexity, narrow scope, say no.** "A major part of the role of a maintainer is saying no." ([standard-of-care](https://words.filippo.io/standard-of-care/)). "Cryptography and security projects require an unusually high degree of code review." ([maintenance](https://filippo.io/maintenance)).

9. **Testability with shared vectors and mutation testing.** "If your protocol uses randomness, please make it a deterministic function that takes a fixed-size string of random bytes, and publish known-answer tests for it." ([randomness-from-the-sky](https://words.filippo.io/avoid-the-randomness-from-the-sky/)). "I added more vectors until I couldn't come up with any more surviving verifier mutations." ([wycheproof#225](https://github.com/C2SP/wycheproof/pull/225#issuecomment-4097291249)).

10. **Security fixes must be safe to ship.** "In a security fix, I would lean against risking performance regressions." ([CL 840685](https://go-review.googlesource.com/c/go/+/840685)). His reason: if the fix causes a regression, people stop upgrading.

---

## 3. Security review checklist (what he checks or pushes back on)

1. **Is the safe path the default? Does the unsafe path need explicit opt-in?** He prefers a hard error over silent mixing of a profile and manual knobs (option C). "If we are serious about having profiles that are well-maintained and comprehensive, and for them to be the way users configure TLS, we should commit to the idea" ([#79043](https://github.com/golang/go/issues/79043#issuecomment-5623975969)).

2. **Does the API make the caller manage nonces, IVs, or framing?** It must not. He lists the steps the old API requires, including "there is one correct answer: nonce || ciphertext" and "Does not spark joy." ([#82456](https://github.com/golang/go/issues/82456)). In the new API, `Seal` refuses AEADs that cannot use random nonces safely. Earlier: "It’s not even a good high-level AEAD API, because it leaves nonce management to the application" ([nacl-api](https://words.filippo.io/nacl-api/)).

3. **Random 96-bit nonces: what is the message budget per key?** "Finally note that regardless of the API, random AES-GCM nonces are only safe up to a couple billion messages per key." ([#80731](https://github.com/golang/go/issues/80731#issuecomment-6416489823)).

4. **Large data: no single AEAD call over a huge plaintext, and no unauthenticated modes.** "You absolutely do not want to use unauthenticated stream ciphers." ([#82535](https://github.com/golang/go/issues/82535)). "Avoid: unauthenticated modes (CBC, CTR, raw stream ciphers), random 96-bit nonces unless you spent a lot of time thinking about how many messages you encrypt, rolling your own AEAD construction." ([right-answers](https://words.filippo.io/right-answers/)).

5. **Is context bound into the ciphertext?** "Since you have an AEAD, consider putting context in the additional data, like the user ID you’re encrypting for, or the version of the protocol." ([right-answers](https://words.filippo.io/right-answers/)).

6. **MACs: authenticate the exact bytes, then compare in constant time.** "Just be careful to sidestep canonicalization and parser alignment bugs by always authenticating a verbatim string of bytes, not something you need to recompute." "Remember to compare tags with dedicated constant-time functions." ([right-answers](https://words.filippo.io/right-answers/)).

7. **Parsers at a trust boundary: reject trailing data, extra fields, and non-canonical encodings.** He reports cases that accept extra DER elements ([#79860](https://github.com/golang/go/issues/79860#issuecomment-5653016962)). For base64 he adds a length check to reject CR/LF "for security-sensitive and cryptography contexts. Would love to have this instead." ([#53845](https://github.com/golang/go/issues/53845#issuecomment-5938570513)).

8. **Can the attacker choose the lookup key?** "Don’t let the attacker dictate your PRIMARY KEY and you won’t have PRIMARY KEY collision attacks." "The index is only needed to mitigate an attack introduced by the existence of the index." ([passkey-record](https://words.filippo.io/passkey-record/)). He removed `CredentialID` because "CredentialID is prone to misuse, because global credential ID lookups must be avoided." ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5386730057)).

9. **Can a verified result be applied to the wrong principal?** He encoded the flow type in the challenge. "This prevents an application mistake where the records are loaded for Response.UnauthenticatedUserID but the result is applied to the logged in user." ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5386730057)). Note the name `UnauthenticatedUserID`: the field name tells the caller not to trust it.

10. **Are challenges single-use, stored on the server, and given a TTL? Is client-side state authenticated?** From his passkey docs: "Client-side storage, such as with cookies, weakens the anti-replay protections." and "Request values don't need to be kept secret but must be protected from tampering." ([passkey 7f1a371](https://github.com/FiloSottile/passkey/commit/7f1a37199ee0a24ef3f3674113809c4031f906f2)).

11. **Degenerate values that mean "everything".** An empty SSH certificate principal list was a wildcard. He accepted a breaking change to stop it: "This is a breaking change, but it's a massive footgun I would not have imagined, and OpenSSH made a similar breaking change, so let's try it." He also asked: "Let's reject len(ValidPrincipals) == 0 here, too." ([CL 844647](https://go-review.googlesource.com/c/crypto/+/844647)).

12. **Randomness source and size.** "Random IDs: 32 random bytes, a.k.a. 256-bit random numbers." "Avoid: non-cryptographic PRNGs, userspace random number generators like OpenSSL’s, haveged, CPU jitter entropy." ([right-answers](https://words.filippo.io/right-answers/)). "the safest thing to do is to just take randomness from the kernel every time you need it." ([2025-state](https://words.filippo.io/2025-state/)).

13. **Key material: uniform keys only, stored as seeds.** Avoid "keys that are not uniform (e.g. using a password or ASCII hex string directly as a key)". For ML-DSA: "Store keys as 32-byte seeds exclusively." ([right-answers](https://words.filippo.io/right-answers/)).

14. **Are signatures needed at all?** "Note that asymmetric signatures are overused" and "Maybe you can replace signed JWTs with random session tokens." ([right-answers](https://words.filippo.io/right-answers/)).

15. **Algorithm and parameter choice: fewer options, modern defaults.** "There is basically never a reason to use -65. -44 is already NIST Category 2, and -87 is the one for 256-bit key aficionados. -65 is pointless." "Let's negotiate them by default, peers will need to actually generate those keys to opt-in to use them anyway." ([CL 819920](https://go-review.googlesource.com/c/crypto/+/819920)). He does not like 256-bit paranoia: "I am 100% team "large enough is enough" and I don't care about 256 bit security levels." ([C2SP#225](https://github.com/C2SP/C2SP/pull/225#discussion_r2991257841)).

16. **Does the code implement the spec exactly?** "However, this CL does not correctly implement https://c2sp.org/tlog-cosignature@v1.1.0#ml-dsa-44 because it signs the textual representation instead of CosignedSubtree, and fails to include the timestamp." ([CL 847066](https://go-review.googlesource.com/c/mod/+/847066)). He also rejects one-off formats: "we should not introduce a new special sumdb-only type." (same CL).

17. **Crash safety and partial states in security code.** "I think this transitions through an unsafe state: if a crash happens between writing the ziphash and removing the partial (or if removing the partial fails)..." He also adds defense in depth: "As defense in depth, I would also forbid the Download path from fetching a golang.org/fips140 module." ([CL 840685](https://go-review.googlesource.com/c/go/+/840685)).

18. **Authentication policy (passkeys, UV, MFA).** UV is required by default, "since this package is aimed primarily at passwordless authentication" ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5386730057)). He refuses allowlists that need constant upkeep: "I really don't want to get on the treadmill of maintaining a mapping of AAGUID to security-relevant capabilities." ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5278656952)). For email login: "A link that logs in the browser that started the login is very easy to phish." ([right-answers](https://words.filippo.io/right-answers/)).

19. **CSRF for cookie-authenticated, state-changing requests.** Use Sec-Fetch-Site first, then Origin. "null must be treated as an indication of a cross-origin request." "Trusted origins should be configured as full origins (e.g. https://example.com) and compared by simple equality with the header value." Keep "a tightly scoped bypass mechanism for e.g. SSO edge cases, with the appropriate safety placards." ([csrf](https://words.filippo.io/csrf/)).

20. **Supply chain changes in the diff (CI, dependencies, tokens).** "it seems clear that pull_request_target is unsafe at any speed, and should just never be used." "For npm, it means using npm ci instead of npm install." ([compromise-survey](https://words.filippo.io/compromise-survey/)). "We run GitHub Actions workflows with read-only permissions and no secrets by default." ([standard-of-care](https://words.filippo.io/standard-of-care/)). His own TypeScript CI does this: `permissions: contents: read`, `persist-credentials: false`, `package-manager-cache: false`, `npm clean-install --ignore-scripts`, and npm publish through OIDC (`id-token: write`, no npm token) ([typage build.yml](https://github.com/FiloSottile/typage/blob/main/.github/workflows/build.yml)).

Also in reviews: coverage gaps. "Is it because we don't have a js/wasm -longtest builder? That doesn't say something great about coverage." ([CL 758441](https://go-review.googlesource.com/c/go/+/758441)).

---

## 4. How he explains a vulnerability or writes a finding

The pattern below comes from his advisories, his Go issue comments, and his posts on specific bugs.

1. **Start with the mechanism in one sentence.** No preamble.
   - "A plugin name containing a path separator may allow an attacker to execute an arbitrary binary." ([age GHSA-32gq-x56h-299c](https://github.com/FiloSottile/age/security/advisories/GHSA-32gq-x56h-299c))
   - "`(*Point).MultiScalarMult` failed to initialize its receiver." ([edwards25519 GHSA-fw7p-63qq-7hpr](https://github.com/FiloSottile/edwards25519/security/advisories/GHSA-fw7p-63qq-7hpr))

2. **Give the attacker's entry point and the preconditions.** The age advisory names the exact APIs that take attacker input. It also gives the required filesystem state ("a directory matching `${TMPDIR:-/tmp}/age-plugin-*` needs to exist") and what the executed binary receives.

3. **Say who is not affected, and say it plainly.** The edwards25519 advisory says that MultiScalarMult is rare, gives the common dependency path, and says "**you are not affected**". It ends with a remark on scanners: "If you were notified of this issue despite not being affected, consider switching to a vulnerability scanner that is more precise and respectful of your attention" ([GHSA-fw7p-63qq-7hpr](https://github.com/FiloSottile/edwards25519/security/advisories/GHSA-fw7p-63qq-7hpr)).

4. **Score severity by reachability, not by alarm.** He lowers inflated scores with arguments about where the input must be. For the OpenSSL punycode bug he said it "might even be a MEDIUM" because the string must sit in an intermediate CA ([openssl-punycode](https://words.filippo.io/openssl-punycode/)). "Also, CVSS 10 for the CVE is ludicrous" ([age#730](https://github.com/FiloSottile/age/issues/730#issuecomment-5073792758)). He also respects triage under time pressure: "Upgrading the severity at the last moment is way worse than downgrading it" ([openssl-punycode](https://words.filippo.io/openssl-punycode/)).

5. **Show proof, not claims.** He pastes `govulncheck` output (source and binary mode) to show that a symbol is not reachable ([age#744](https://github.com/FiloSottile/age/issues/744#issuecomment-5551400696), [age#730](https://github.com/FiloSottile/age/issues/730#issuecomment-5073792758)). He reviews spec PRs with a table of test vectors and the bug each one catches ([wycheproof#225](https://github.com/C2SP/wycheproof/pull/225#issuecomment-4097291249)).

6. **Tell the attack as a short, concrete story.** Example: UV is not set up, the authenticator is stolen, the attacker sets their own PIN, then logs in with UV=1 ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5321051842)). He then ranks it against a weaker scenario: a PIN-less YubiKey lost "in a parking lot" is "a much more compelling risk to mitigate" than access to an unlocked device ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5343462634)). For NaCl box he describes a MitM that reflects a message back to its sender ([nacl-api](https://words.filippo.io/nacl-api/)).

7. **Find the root cause and the process lesson.** Near-miss: "a combination of the pre-existing complexity and unsafety of some optimized assembly, of undocumented assumptions" ([near-miss](https://words.filippo.io/near-miss/)). Punycode: the bug "could be found in a second by LibFuzzer with the simplest possible fuzzing function" ([openssl-punycode](https://words.filippo.io/openssl-punycode/)).

8. **Remediation is more than a version bump.** "A security vulnerability should be assessed for its impact: production might need to be updated, secrets rotated, users notified!" and "A business-as-usual dependency bump is a woefully insufficient remediation for an actual vulnerability" ([dependabot](https://words.filippo.io/dependabot/)).

9. **When he takes action, give the fact, the principle, and the consequence.** In the eMudhra response: the keys are compromised and revoked. Linux trust stores cannot propagate the revocation "(a pile of PEM files behind a dumpster)". Then the principle and the action: "An application that accepts chains through these revoked intermediates is not secure, so we patched the Go cryptography libraries accordingly." ([#82345](https://github.com/golang/go/issues/82345#issuecomment-6294844223)).

10. **Give credit and links.** The age advisory thanks the reporter and links the matching rage advisory.

His 2026 view of the process: "The bottleneck now is not finding potential issues but assessing which ones are real." and "Triage, rapid remediation, and—as ever—prevention are the job now." ([vuln-reports](https://words.filippo.io/vuln-reports/)).

---

## 5. Tone and phrasing

Direct and informal, with dry humor. He gives short verdicts and backs them with numbers or links. He uses CAPS or *italics* for emphasis. In code review he often uses `suggestion` blocks with exact replacement code, `nit:`, and "LGTM". He says openly when he is not sure, and he corrects himself in public.

Verbatim examples:

1. "Does not spark joy." ([#82456](https://github.com/golang/go/issues/82456))
2. "BUT CATEGORICALLY NOT USE IT DIRECTLY because it will blow your foot clean off" (on `cipher.Block`, [#82456](https://github.com/golang/go/issues/82456))
3. "age is affected by none of those. Get a better security scanner." ([age#744](https://github.com/FiloSottile/age/issues/744#issuecomment-5551400696))
4. "Frankly, if JOSE had not reinvented (worse) wire formats for everything, from keys to ciphertexts, it wouldn't have this problem." ([#80731](https://github.com/golang/go/issues/80731#issuecomment-6416489823))
5. "-65 is pointless." ([CL 819920](https://go-review.googlesource.com/c/crypto/+/819920))
6. "This is definitely more words than I am willing to read start-to-finish" ([#81228](https://github.com/golang/go/issues/81228#issuecomment-5464113346))
7. "That's definitely not a viable option." ([#79043](https://github.com/golang/go/issues/79043#issuecomment-5636322923))
8. "Dependabot is a noise machine." ([dependabot](https://words.filippo.io/dependabot/))
9. "The scheme is too clever by three quarters" ([reconstruct-vs-validate](https://words.filippo.io/reconstruct-vs-validate/))
10. "Avoid: rolling your own YoloMAC, encrypted hashes, standalone one-time MACs like Poly1305 or GMAC." ([right-answers](https://words.filippo.io/right-answers/))
11. "I just wish we had a principled reason for it." (on a security bound, [C2SP#225](https://github.com/C2SP/C2SP/pull/225#discussion_r2997865186))
12. "Can you walk me through how that attack works against e.g. iCloud Keychain?" ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5321051842))
13. "This would *technically* be a breaking change to tlog-checkpoint, but I would argue it was instead previously under-specified, and no deployed origin is affected, so LGTM." ([C2SP#357](https://github.com/C2SP/C2SP/pull/357#pullrequestreview-5373904949))
14. "On unsupported platforms this should just invoke f. We can't litter every call site with build tags." ([CL 704615](https://go-review.googlesource.com/c/go/+/704615))

Style notes (inference from the sample):
- Most inline review comments are one or two sentences, or one `suggestion` block. Long comments are for design questions.
- He sets out options as A/B/C with a recommendation ([#79043](https://github.com/golang/go/issues/79043#issuecomment-5623975969)).
- He sends off-topic or repeat discussion elsewhere, briefly ("This is off-topic for this discussion.", [#80663](https://github.com/golang/go/issues/80663#issuecomment-5386485086)).
- He gives exact numbers for performance or security claims (for example "~660K", "O(1ms) on SSD" in [CL 840685](https://go-review.googlesource.com/c/go/+/840685), and "2^38 / 4 PiB" in [C2SP#225](https://github.com/C2SP/C2SP/pull/225#discussion_r3002641662)).

---

## 6. Hard "no"s and pet peeves

- **Configuration knobs and escape hatches** for hypothetical needs ([#81228](https://github.com/golang/go/issues/81228#issuecomment-5464334284), [#79043](https://github.com/golang/go/issues/79043#issuecomment-5623975969)).
- **Rolling your own** MAC, AEAD, key exchange, transport protocol, multihash, or ACME client: "Don’t roll your own key exchange protocol." "Avoid: rolling your own transport protocol" ([right-answers](https://words.filippo.io/right-answers/)).
- **Unauthenticated encryption** (CBC, CTR, raw stream ciphers). One huge AEAD message.
- **APIs that look high-level but are sharp**: NaCl box, the old `cipher.AEAD` ([nacl-api](https://words.filippo.io/nacl-api/), [#82456](https://github.com/golang/go/issues/82456)).
- **OpenPGP, JOSE wire formats, encrypted email**, and TLS libraries with a bad record (OpenSSL if possible, wolfSSL, Mbed TLS, GnuTLS, Botan) ([right-answers](https://words.filippo.io/right-answers/), [#80731](https://github.com/golang/go/issues/80731#issuecomment-6416489823)).
- **Lenient parsers**: trailing data, non-canonical encodings ([#79860](https://github.com/golang/go/issues/79860#issuecomment-5653016962)).
- **Lookups keyed by attacker-chosen IDs** ([passkey-record](https://words.filippo.io/passkey-record/)).
- **Signatures where a MAC or a random session token works**, and signed JWTs by habit ([right-answers](https://words.filippo.io/right-answers/)).
- **Userspace RNGs, CPU jitter entropy, `Math.random`-class PRNGs**, and "randomness from the sky" in specs ([right-answers](https://words.filippo.io/right-answers/), [randomness-from-the-sky](https://words.filippo.io/avoid-the-randomness-from-the-sky/)).
- **Dependabot, noisy scanners without reachability, and CVSS inflation** ([dependabot](https://words.filippo.io/dependabot/), [age#730](https://github.com/FiloSottile/age/issues/730#issuecomment-5073792758)). Maintainers must not carry the cost of bad scanners: "the cost of defective scanners _must not_ be offloaded on the entire open source ecosystem".
- **Privileged CI with attacker-controlled context** (`pull_request_target`, `issue_comment`), mutable Action tags, caches in privileged workflows, long-lived tokens ([compromise-survey](https://words.filippo.io/compromise-survey/)).
- **Phishable authentication**: SMS, using TOTP, phishable magic links. "We never enable SMS as an authentication mechanism or as an account recovery mechanism" and "TOTP can’t hurt us if we don’t use it." ([standard-of-care](https://words.filippo.io/standard-of-care/)).
- **Blaming the user or the application** for a library footgun ([#80663](https://github.com/golang/go/issues/80663#issuecomment-5386485086)).
- **Security folklore**: "Grover halves AES", 256-bit everything. "AES-128 is safe against quantum computers." ([128-bits](https://words.filippo.io/128-bits/)).
- **Composite/hybrid signatures** (with an SSH exception) and **HashML-DSA** ([right-answers](https://words.filippo.io/right-answers/)).
- **Long walls of text that repeat old discussion** ([#81228](https://github.com/golang/go/issues/81228#issuecomment-5464113346)).
- **Changes to compatibility he cannot justify**: he refuses to break every program that sets `MinVersion` ([#79043](https://github.com/golang/go/issues/79043#issuecomment-5636322923)). But he accepts a break to remove a "massive footgun" ([CL 844647](https://go-review.googlesource.com/c/crypto/+/844647)).

---

## 7. Heuristics for a TypeScript web app (Next.js, Supabase RLS, API routes, webhooks, auth tokens, npm)

Each item applies his stated principles to this stack. The mapping is **inference** unless a quote is given. His source principle is in brackets.

**Auth and sessions**
1. Prefer passkeys. As a fallback, use an email link with an opaque random token that logs in the browser that opens it. Do not use SMS. If you must have passwords, use Argon2id with "m=64 MiB, t=2, p=1". ["Password handling" in [right-answers](https://words.filippo.io/right-answers/)]
2. For first-party sessions, prefer opaque 256-bit random tokens with a server-side lookup to self-signed JWTs where possible. ["Maybe you can replace signed JWTs with random session tokens."] Supabase issues JWTs by design. So on the server, use the verified user (`auth.getUser()` or verified claims). Do not use data that the client decoded from the token. [no "way to accidentally trust unverified information"]
3. Name untrusted values as untrusted, in the type system: for example, a branded `UnverifiedUserId` that an authorization function does not accept. [`Response.UnauthenticatedUserID`, [#80663](https://github.com/golang/go/issues/80663#issuecomment-5386730057)]
4. OAuth `state`, magic-link tokens, passkey challenges, password-reset tokens: store them on the server with a TTL, delete them on use, and bind them to the flow and the user they were issued for. If state must live in a cookie, authenticate it, and accept that replay protection is weaker. [passkey commit [7f1a371](https://github.com/FiloSottile/passkey/commit/7f1a37199ee0a24ef3f3674113809c4031f906f2)]

**Supabase RLS and data access**
5. Never let the request choose whose row it touches. Derive the owner from `auth.uid()` in the policy, not from a `user_id` in the body. ["Don’t let the attacker dictate your PRIMARY KEY"]
6. Default deny. RLS on for every table. A policy or allowlist that is empty must not mean "all". [empty principal list footgun, [CL 844647](https://go-review.googlesource.com/c/crypto/+/844647)]
7. The service-role key is the biggest knob in the system. Keep it server-only. Keep it out of any `NEXT_PUBLIC_` variable. Keep it in as few code paths as possible. Each use is an explicit "unsafe" acknowledgement. ["unsafe functionality... should require explicit acknowledgement in the API"]

**API routes, server actions, CSRF**
8. For cookie-authenticated state changes, reject cross-origin requests: allow safe methods, allow exact-match trusted origins, check `Sec-Fetch-Site` (`same-origin`/`none`), treat `Origin: null` as cross-origin, then fall back to Origin vs Host. Make sure no GET handler changes state. Exempt OAuth callbacks by route, as a narrow and documented bypass. [[csrf](https://words.filippo.io/csrf/)]
9. Validate input at the trust boundary with strict schemas that reject unknown and extra fields (for example zod `.strict()`). Reject non-canonical encodings in security contexts. [[#79860](https://github.com/golang/go/issues/79860#issuecomment-5653016962), [#53845](https://github.com/golang/go/issues/53845#issuecomment-5938570513)]

**Webhooks**
10. Verify the HMAC over the raw body bytes before `JSON.parse`. Then process only those bytes. Do not re-serialize. Compare with `crypto.timingSafeEqual` (check the lengths first). Reject old timestamps and event IDs you already processed. ["always authenticating a verbatim string of bytes", "compare tags with dedicated constant-time functions"]

**Secrets, randomness, encryption**
11. Tokens and IDs: `crypto.getRandomValues` / `crypto.randomBytes(32)`. Never `Math.random`. UUIDv4 gives about 122 random bits. That is fine for IDs, but use 32 bytes for secrets. ["Random IDs: 32 random bytes"]
12. App-level encryption: use the cloud KMS, or XChaCha20-Poly1305 / XAES-256-GCM with random nonces from an audited library. He builds his own TypeScript libraries on `@noble/*` ([typage package.json](https://github.com/FiloSottile/typage/blob/main/package.json)). Put the user ID and the purpose in AAD. Never use a password or a hex string directly as a key. Do not use AES-CBC/CTR. Stream large files in chunks (Cobblestone has a TypeScript implementation: [cobblestone.ts](https://github.com/FiloSottile/cobblestone.ts)).

**npm and CI supply chain**
13. Install with `npm ci --ignore-scripts` (his CI uses `npm clean-install --ignore-scripts`). Commit the lockfile. Do not let bots auto-merge dependency bumps. Update dependencies on your own release cycle. Run a separate CI job that tests against the latest versions. ["Dependencies should be updated according to your development cycle, not the cycle of each of your dependencies."]
14. Triage `npm audit` output by reachability before you act. Demand at least package-level filtering. If a finding is real, the remediation can include rotating secrets and notifying users, not only a bump. [[dependabot](https://words.filippo.io/dependabot/), [maintenance](https://filippo.io/maintenance)]
15. GitHub Actions: no `pull_request_target` or `issue_comment` that runs PR code. `permissions: contents: read` by default. `persist-credentials: false`. No caches in workflows that have secrets. Pin Actions by commit hash. Run zizmor. Publish to npm with Trusted Publishing (OIDC), not a stored `NPM_TOKEN`. [[compromise-survey](https://words.filippo.io/compromise-survey/), [standard-of-care](https://words.filippo.io/standard-of-care/), [typage build.yml](https://github.com/FiloSottile/typage/blob/main/.github/workflows/build.yml)]
16. Use phishing-resistant 2FA (passkeys or security keys) on every account that can affect users: GitHub, npm, Vercel, Supabase, DNS, registrar, email, password manager. No SMS recovery. [[standard-of-care](https://words.filippo.io/standard-of-care/)]

**Review process**
17. Get an LLM review on security-sensitive diffs, and have a human review all LLM-written code. Write security fixes small, with no new performance risk, and with defense in depth on the same path. [[right-answers](https://words.filippo.io/right-answers/), [standard-of-care](https://words.filippo.io/standard-of-care/), [CL 840685](https://go-review.googlesource.com/c/go/+/840685)]

---

## 8. Sources

GitHub issues and PRs (his comments):
- https://github.com/golang/go/issues/80663 (crypto/passkey proposal, 2026-07 to 08)
- https://github.com/golang/go/issues/82456 (crypto/aead proposal, 2026-10-23)
- https://github.com/golang/go/issues/82535 (crypto/cobblestone proposal, 2026-10-26)
- https://github.com/golang/go/issues/79043 (TLS Profiles, 2026-09)
- https://github.com/golang/go/issues/81228 (TLS 1.3 cipher suites knob, 2026-08)
- https://github.com/golang/go/issues/80731 (external random GCM nonce, 2026-10-26)
- https://github.com/golang/go/issues/79860 (trailing DER in x509, 2026-09-13)
- https://github.com/golang/go/issues/82345 (eMudhra CA mitigation, 2026-10-20)
- https://github.com/golang/go/issues/53845 (base64 RejectLineFeeds, 2026-10-01)
- https://github.com/golang/go/issues/81227 (x/crypto/openpgp delete, 2026-08-29)
- https://github.com/golang/go/issues/77143 (CRL checking, 2026-01-13)
- https://github.com/golang/go/issues/76294 and https://github.com/golang/go/issues/43774 (AEAD refresh pointers)
- https://github.com/golang/go/issues/68762 (RSA < 1024 bits, 2024; older)
- https://github.com/golang/go/issues/70795 (ssh VerifiedPublicKeyCallback, 2024 to 2025)
- https://github.com/FiloSottile/age/issues/744 and https://github.com/FiloSottile/age/issues/730 (scanners, 2026)
- https://github.com/C2SP/C2SP/pull/225 (chunked-encryption review, 2026-03 to 06)
- https://github.com/C2SP/C2SP/pull/245, /pull/293, /pull/357 (tlog spec reviews, 2026)
- https://github.com/C2SP/wycheproof/pull/225, /pull/254 (ML-DSA vectors, schemas, 2026)
- https://github.com/hpkewg/hpke/pull/42 (2025-11)
- https://github.com/FiloSottile/sunlight/issues/74 (2026-10)
- https://github.com/galadran/we-have-a-problem.com/issues/48, /issues/130 (2026-10)

Gerrit inline comments (Go):
- https://go-review.googlesource.com/c/crypto/+/844647 (empty SSH principals, 2026-10-06)
- https://go-review.googlesource.com/c/crypto/+/854345 (MaxAuthTries, 2026-10-27)
- https://go-review.googlesource.com/c/crypto/+/819920 (ssh ML-DSA, 2026-09-08)
- https://go-review.googlesource.com/c/crypto/+/828364, /+/816840, /+/552495 (ssh, 2026-08 to 09)
- https://go-review.googlesource.com/c/mod/+/847066 (sumdb ML-DSA, 2026-10-13)
- https://go-review.googlesource.com/c/go/+/840685 (go.sum hashes for fips140 security fix, 2026-10-01)
- https://go-review.googlesource.com/c/go/+/758441 (FIPS 140-3 Wasm, 2026-05 to 10)
- https://go-review.googlesource.com/c/go/+/704615 (runtime/secret, 2025-10 to 11)
- https://go-review.googlesource.com/c/go/+/836445, /+/846245 (FIPS build-time, s390x, 2026-09 to 10)

Advisories and commits:
- https://github.com/FiloSottile/edwards25519/security/advisories/GHSA-fw7p-63qq-7hpr (2026-02-17)
- https://github.com/FiloSottile/age/security/advisories/GHSA-32gq-x56h-299c (2024-12-18)
- https://github.com/FiloSottile/passkey/commit/7f1a37199ee0a24ef3f3674113809c4031f906f2 (2026-10-26)
- https://github.com/FiloSottile/sunlight/commit/aeba583bcb3ebf1016b8a09ead89255d99dc9449 (2026-10-19)
- https://github.com/FiloSottile/typage/blob/main/.github/workflows/build.yml and /package.json
- https://github.com/FiloSottile/cobblestone.ts, https://github.com/geomys/magnolia, https://github.com/geomys/ct-archive

Blog and docs (words.filippo.io unless noted):
- https://words.filippo.io/seeds-solved/ (2026-10-16)
- https://words.filippo.io/right-answers/ (2026-10-12)
- https://words.filippo.io/mldsa-py/ (2026-07-26, listed, not quoted)
- https://words.filippo.io/passkey-record/ (2026-07-20)
- https://words.filippo.io/vuln-reports/ (2026-06-23)
- https://words.filippo.io/128-bits/ (2026-04-20)
- https://words.filippo.io/crqc-timeline/ (2026-04-06)
- https://words.filippo.io/dependabot/ (2026-02-20)
- https://words.filippo.io/go-source/ (2026-02-12)
- https://words.filippo.io/gosum/ (2026-01-05)
- https://words.filippo.io/keyserver-tlog/ (2025-12-19, skimmed)
- https://words.filippo.io/2025-state/ (2025-11-20, transcript of GopherCon US 2025 talk)
- https://words.filippo.io/claude-debugging/ (2025-11-01)
- https://words.filippo.io/standard-of-care/ (2025-10-23)
- https://words.filippo.io/compromise-survey/ (2025-10-10)
- https://words.filippo.io/csrf/ (2025-08-13)
- https://words.filippo.io/near-miss/ (2023), https://words.filippo.io/avoid-the-randomness-from-the-sky/ (2023), https://words.filippo.io/openssl-punycode/ (2022), https://words.filippo.io/reconstruct-vs-validate/ (2020), https://words.filippo.io/nacl-api/ (2020)
- https://filippo.io/maintenance (maintenance policy, updated Dec 2024)
- https://go.dev/design/cryptography-principles (Go Cryptography Principles, 2019)
- https://emudhra.we-have-a-problem.com/ (incident site he contributed to. The page text is not attributed to him, so it is not quoted.)

Gaps:
- No 2026 talk was found by web search. The 2025 GopherCon talk transcript is the newest talk source.
- The Gerrit `/messages` endpoint (top-level review messages) failed. Only inline comments were sampled.
- Bluesky and Mastodon posts were not sampled.
