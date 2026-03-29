# profiles/arm64.sh — ARM64 native build profile
#
# For native builds on ARM64 hardware (Raspberry Pi 4/5, Apple Silicon via
# Asahi, Ampere, AWS Graviton, etc.).
#
# For cross-compilation from x86-64, also set:
#   CROSS_COMPILE=aarch64-linux-gnu-
#
# Usage:
#   ./build.sh --profile arm64
#   CROSS_COMPILE=aarch64-linux-gnu- ./build.sh --profile arm64

BRANCH="${BRANCH:-MAIN}"

# KARCH is set by build.sh via uname -m on native ARM64.
# For cross-compilation, override explicitly:
KARCH="${KARCH:-arm64}"

ENABLE_ROG=0
ENABLE_MEDIATEK_BT=0
ENABLE_FS_PATCHES=0
ENABLE_NET_PATCHES=0
ENABLE_CACHY=0
ENABLE_PARALLEL_BOOT=0

LZ4_SWAP=1
NO_DEBUG=1
