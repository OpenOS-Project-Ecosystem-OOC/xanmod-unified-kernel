#!/usr/bin/env bash
# packaging/arch/install.sh — Arch Linux kernel install via PKGBUILD
#
# Builds a pacman package from the compiled source tree using
# `make pacman-pkg`, then installs it with pacman.
#
# Environment:
#   KERNEL_SRC   path to compiled kernel source tree
#   KARCH        kernel architecture

set -euo pipefail

KERNEL_SRC="${KERNEL_SRC:?KERNEL_SRC not set}"
KARCH="${KARCH:?KARCH not set}"

cd "${KERNEL_SRC}"
KERNEL_VERSION="$(make -s kernelrelease)"
echo "==> Packaging kernel ${KERNEL_VERSION} for Arch Linux"

# pacman-pkg produces a .pkg.tar.zst in the parent directory
make -j"$(nproc)" ARCH="${KARCH}" pacman-pkg

PKG_DIR="$(dirname "${KERNEL_SRC}")"
PKG_FILE=$(find "${PKG_DIR}" -maxdepth 1 -name "linux-*.pkg.tar.zst" | sort | tail -1)

if [[ -z "${PKG_FILE}" ]]; then
  echo "ERROR: pacman package not found after build." >&2
  exit 1
fi

echo "==> Installing ${PKG_FILE}"
pacman -U --noconfirm "${PKG_FILE}"

echo "==> Arch install complete. Reboot to use kernel ${KERNEL_VERSION}."
