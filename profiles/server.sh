# profiles/server.sh — server / headless profile
#
# Targets x86-64 servers. Uses LTS branch and x86-64-v2 for broad
# hardware compatibility. Disables desktop-oriented features.
#
# Usage:
#   ./build.sh --profile server
#   ./build.sh --profile server --vendor intel

BRANCH="${BRANCH:-LTS}"
MLEVEL="${MLEVEL:-v2}"

ENABLE_ROG=0
ENABLE_MEDIATEK_BT=0
ENABLE_FS_PATCHES=0
ENABLE_NET_PATCHES=1    # BBR + nftables relevant for servers
ENABLE_CACHY=0
ENABLE_PARALLEL_BOOT=0

LZ4_SWAP=0              # servers typically don't use swap compression
NO_DEBUG=1

# Server extra config — disable desktop/GUI drivers
# Add EXTRA_CONFIG=configs/server-extra.config once that fragment is authored
EXTRA_CONFIG="${EXTRA_CONFIG:-}"
