#!/usr/bin/env bash
# packaging/devuan/install.sh — Devuan kernel install (no systemd)
#
# Source-built mode only: packages the compiled tree as a .deb and installs it.
# Devuan uses initramfs-tools (sysvinit-based) — no systemd dependency.
#
# Environment:
#   KERNEL_SRC        path to compiled kernel source tree
#   KARCH             kernel architecture

set -euo pipefail

KERNEL_SRC="${KERNEL_SRC:?KERNEL_SRC not set}"
KARCH="${KARCH:?KARCH not set}"

cd "${KERNEL_SRC}"
KERNEL_VERSION="$(make -s kernelrelease)"
echo "==> Packaging kernel ${KERNEL_VERSION} as .deb"

make -j"$(nproc)" ARCH="${KARCH}" bindeb-pkg

DEB_DIR="$(dirname "${KERNEL_SRC}")"
echo "==> Installing generated .deb packages from ${DEB_DIR}"
dpkg -i "${DEB_DIR}"/linux-image-*.deb "${DEB_DIR}"/linux-headers-*.deb 2>/dev/null || true
apt-get install -f -y

echo "==> Updating initramfs"
update-initramfs -u -k all

echo "==> Updating bootloader"
if command -v update-grub &>/dev/null; then
  update-grub
elif command -v grub-mkconfig &>/dev/null; then
  grub-mkconfig -o /boot/grub/grub.cfg
fi

echo "==> Devuan install complete. Reboot to use kernel ${KERNEL_VERSION}."
