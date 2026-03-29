# configs/

Kernel `.config` fragments composed via `scripts/kconfig/merge_config.sh`
(part of the kernel source tree itself).

## Layout

```
configs/
├── base/           Architecture + microarch level base configs
│   ├── x86-64-v1.config   Generic x86-64 (SSE2 baseline)
│   ├── x86-64-v2.config   x86-64-v2 (SSE4.2, POPCNT)
│   ├── x86-64-v3.config   x86-64-v3 (AVX2) — most modern desktops
│   ├── x86-64-v4.config   x86-64-v4 (AVX-512) — server/HEDT
│   ├── aarch64.config     ARM64 base
│   └── riscv64.config     RISC-V 64-bit base
├── arch/           Per-architecture option overrides
│   ├── amd.config         AMD-specific tuning (disable most Intel features)
│   └── intel.config       Intel-specific tuning
├── features/       Optional feature fragments
│   ├── rt.config          PREEMPT_RT (applied automatically for RT branch)
│   ├── lz4-swap.config    LZ4 compressed swap as default
│   ├── no-debug.config    Disable NUMA emulation, kernel hacking, debug symbols
│   └── performance.config Governor=performance, HZ=1000, tickless
└── hardware/       Hardware-specific fragments
    └── asus-rog.config    ASUS ROG WMI, fan curves, tablet mode
```

## How fragments are merged

`build.sh` calls `scripts/kconfig/merge_config.sh` from the kernel source tree,
which handles symbol conflicts by preferring later fragments. The merge order is:

1. `configs/base/<arch>-<level>.config`   (foundation)
2. `configs/arch/<vendor>.config`          (CPU vendor tuning, if set)
3. `configs/features/*.config`             (enabled features)
4. `configs/hardware/*.config`             (hardware-specific, if profile active)
5. User-supplied fragment via `EXTRA_CONFIG=path/to/fragment.config`

## Microarch level auto-detection

`build.sh` reads `/proc/cpuinfo` to select the appropriate x86-64 level.
Override with `MLEVEL=v3` (or v1/v2/v4).
