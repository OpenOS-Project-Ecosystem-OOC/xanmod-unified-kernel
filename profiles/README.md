# profiles/

Named build profiles. Each profile is a shell script sourced by `build.sh`
before argument processing completes, so any variable set in a profile can
still be overridden on the command line.

## Usage

```bash
./build.sh --profile rog
./build.sh --profile desktop
./build.sh --profile server --branch LTS
```

## Writing a profile

A profile sets environment variables that `build.sh` reads. Any variable
documented in `build.sh --help` is valid. Example:

```bash
# profiles/myprofile.sh
BRANCH="MAIN"
MLEVEL="v3"
VENDOR="amd"
ENABLE_ROG=0
NO_DEBUG=1
LZ4_SWAP=1
```

## Available profiles

| Profile   | Description |
|-----------|-------------|
| `rog`     | ASUS ROG laptops — ROG patches + config, MediaTek BT, s0ix, LZ4 swap |
| `desktop` | General desktop — AVX2, performance governor, LZ4 swap, no debug |
| `server`  | Server/headless — LTS branch, generic x86-64-v2, no desktop drivers |
| `rt`      | Real-time — RT branch, PREEMPT_RT, HZ=1000 |
| `arm64`   | ARM64 cross/native build baseline |
