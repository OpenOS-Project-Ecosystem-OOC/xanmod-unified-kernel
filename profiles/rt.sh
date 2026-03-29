# profiles/rt.sh — real-time profile
#
# Targets audio production, industrial control, and other latency-sensitive
# workloads. Uses the RT branch (PREEMPT_RT).
#
# Usage:
#   ./build.sh --profile rt

BRANCH="RT"
MLEVEL="${MLEVEL:-v3}"

ENABLE_ROG=0
ENABLE_MEDIATEK_BT=0
ENABLE_FS_PATCHES=0
ENABLE_NET_PATCHES=0
ENABLE_CACHY=0          # cacule conflicts with PREEMPT_RT
ENABLE_PARALLEL_BOOT=0

LZ4_SWAP=0
NO_DEBUG=1

# ENABLE_RT is set automatically by build.sh when BRANCH=RT
