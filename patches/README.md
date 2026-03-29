# patches/

Patch sets applied on top of the XanMod kernel source.

## Directory layout

```
patches/
├── core/           Applied to every build unconditionally
├── hardware/
│   ├── asus-rog/   ASUS ROG platform patches (opt-in via ENABLE_ROG=1 or profile)
│   └── mediatek-bt/ MT7921 Bluetooth patches (opt-in via ENABLE_MEDIATEK_BT=1)
├── fs/             Filesystem patches (opt-in per patch)
├── net/            Network patches (opt-in per patch)
├── sched/          Scheduler patches (opt-in via ENABLE_CACHY=1)
└── boot/           Boot-time patches (opt-in via ENABLE_PARALLEL_BOOT=1)
```

## Patch index file

Each subdirectory contains a `series` file listing patches in application order,
one filename per line. Lines starting with `#` are comments. Empty lines are ignored.
This mirrors the quilt/git-am series format.

## Adding a patch

1. Place the `.patch` file in the appropriate subdirectory.
2. Add its filename to the `series` file in that subdirectory.
3. Document its origin and kernel version range in a comment above the entry.

## Patch naming convention

```
NNN-description-of-change.patch
```

`NNN` is a zero-padded sequence number controlling application order within a series.
Patches sourced from upstream (already merged in a later kernel version) should be
prefixed with `upstream-` and removed once the minimum supported kernel version
passes the merge point.
