# integrations/bdfs/

btrfs-dwarfs-framework integration for XanMod Unified Kernel.

XanMod is a **secondary/fallback kernel** for btrfs-dwarfs-framework,
used when liqxanmod is unavailable or a pure XanMod build is preferred.
XanMod's BORE scheduler and low-latency patches make it well-suited as
a bdfs host for desktop and server workloads.

## Building with bdfs support

```sh
# Build tier1 (stable) with bdfs module
make bdfs-profile

# Or merge fragment manually and build
make bdfs-module-only BDFS_DIR=/path/to/btrfs-dwarfs-framework
```

## btrfs-dwarfs-framework

Source: [Interested-Deving-1896/btrfs-dwarfs-framework](https://github.com/Interested-Deving-1896/btrfs-dwarfs-framework)

**Kernel priority in btrfs-dwarfs-framework:**
1. `liqxanmod` — primary/default
2. `xanmod-unified-kernel` — secondary fallback ← this repo
3. `liquorix-unified-kernel` — secondary fallback
4. Custom kernel — user/dev hook
