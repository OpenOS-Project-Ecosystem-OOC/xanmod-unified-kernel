# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# xanmod-sources.ebuild — Gentoo ebuild for XanMod kernel sources
#
# Place in a local overlay at:
#   sys-kernel/xanmod-sources/xanmod-sources-${PV}.ebuild
#
# USE flags:
#   rog          Apply ASUS ROG hardware patches
#   cachy        Apply CachyOS scheduler patch
#   lz4-swap     Enable LZ4 compressed swap by default
#   no-debug     Disable debug/tracing overhead

EAPI=8

inherit kernel-build

DESCRIPTION="XanMod patched Linux kernel sources"
HOMEPAGE="https://xanmod.org https://gitlab.com/xanmod/linux"

# Update these for each new release
XANMOD_VERSION="6.19"
XANMOD_PATCHLEVEL="1"
MY_PV="${XANMOD_VERSION}-xanmod${XANMOD_PATCHLEVEL}"

SRC_URI="
  https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${XANMOD_VERSION}.tar.xz
"

# XanMod patches are applied via the unified patch system in this repo.
# Point S at the kernel source fetched by kernel/fetch.sh, or use SRC_URI
# to fetch a release tarball from gitlab.com/xanmod/linux/-/releases.

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="rog cachy lz4-swap no-debug"

BDEPEND="
  sys-devel/bc
  sys-devel/bison
  sys-devel/flex
  dev-libs/openssl
  app-arch/lz4
"

src_prepare() {
  local REPO_ROOT="${FILESDIR}/../../.."

  # Apply core patches
  if [[ -f "${REPO_ROOT}/scripts/apply-patches.sh" ]]; then
    ENABLE_ROG=$(usex rog 1 0) \
    ENABLE_CACHY=$(usex cachy 1 0) \
    bash "${REPO_ROOT}/scripts/apply-patches.sh" "${S}" "${REPO_ROOT}/patches"
  fi

  # Merge config fragments
  local fragments=("${REPO_ROOT}/configs/base/x86-64-v3.config"
                   "${REPO_ROOT}/configs/features/performance.config")
  use lz4-swap && fragments+=("${REPO_ROOT}/configs/features/lz4-swap.config")
  use no-debug  && fragments+=("${REPO_ROOT}/configs/features/no-debug.config")
  use rog       && fragments+=("${REPO_ROOT}/configs/hardware/asus-rog.config")

  "${S}/scripts/kconfig/merge_config.sh" -m "${S}/.config" "${fragments[@]}"

  kernel-build_src_prepare
}
