# profiles/desktop.sh — general desktop/gaming profile
#
# Targets modern x86-64 desktops and laptops (AVX2+).
# Optimises for low latency and throughput without hardware-specific patches.
#
# Usage:
#   ./build.sh --profile desktop
#   ./build.sh --profile desktop --vendor amd

BRANCH="${BRANCH:-MAIN}"
MLEVEL="${MLEVEL:-v3}"

ENABLE_ROG=0
ENABLE_MEDIATEK_BT=0
ENABLE_FS_PATCHES=0
ENABLE_NET_PATCHES=1    # UDP IPv6 optimisations benefit all desktop users
ENABLE_CACHY=0
ENABLE_PARALLEL_BOOT=0

LZ4_SWAP=1
NO_DEBUG=1
