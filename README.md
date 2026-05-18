[update-readmes]   Mode: rewrite — migrating to template structure...
# xanmod-unified-kernel

[![Built with Ona](https://ona.com/build-with-ona.svg)](https://app.ona.com/#https://github.com/Interested-Deving-1896/xanmod-unified-kernel)

<!-- AI:start:what-it-does -->
This project provides a build system for the XanMod Linux kernel that is both distribution-agnostic and architecture-agnostic. It simplifies the process of building and packaging the XanMod kernel for various Linux distributions and hardware architectures, making it useful for developers, system integrators, and advanced users who require a custom kernel.
<!-- AI:end:what-it-does -->

## Architecture

<!-- AI:start:architecture -->
The project consists of a distro-agnostic and architecture-agnostic build system for the XanMod Linux kernel. It uses shell scripts and configuration files to automate kernel compilation and packaging. The key components include:

- **Build Scripts**: Located in the `build.sh` file, these scripts handle the kernel build process for different architectures.
- **Configurations**: The `configs` directory contains kernel configuration files tailored for various use cases.
- **Patches**: The `patches` directory includes custom patches applied during the build process.
- **Profiles**: The `profiles` directory defines build profiles for specific distributions or environments.
- **CI Workflows**: GitHub Actions workflows in `.github/workflows` automate builds, linting, and artifact mirroring.
- **Documentation**: The `docs` directory provides usage instructions and contribution guidelines.
- **Gentoo Overlay**: The `gentoo-overlay` directory contains files for integrating the kernel with Gentoo systems.

Directory structure:
```plaintext
.
├── .devcontainer
├── .github
│   └── workflows
├── .gitignore
├── .gitlab-ci.yml
├── CONTRIBUTING.md
├── README.md
├── build.sh
├── configs
├── docs
├── fastci.config.json
├── gentoo-overlay
├── kernel
├── packaging
├── patches
├── profiles
└── scripts
```
<!-- AI:end:architecture -->

## Install

<!-- Add installation instructions here. This section is yours — the AI will not modify it. -->

```bash
git clone https://github.com/Interested-Deving-1896/xanmod-unified-kernel.git
cd xanmod-unified-kernel
```

## Usage

<!-- Add usage examples here. This section is yours — the AI will not modify it. -->

## Configuration

<!-- Document configuration options here. This section is yours — the AI will not modify it. -->

## CI

<!-- AI:start:ci -->
- **build-arm64.yml**: Builds the XanMod kernel for ARM64 architecture. No secrets required.  
- **build-selfhosted.yml**: Builds the kernel on self-hosted runners for custom environments. No secrets required.  
- **build-x86.yml**: Builds the XanMod kernel for x86 architecture. No secrets required.  
- **labeler.yml**: Automatically applies labels to pull requests based on file changes. No secrets required.  
- **lint.yml**: Lints shell scripts and configuration files for style and syntax issues. No secrets required.  
- **release.yml**: Creates and publishes kernel release artifacts to GitHub Releases. Requires `GITHUB_TOKEN` (provided by default) and optional `RELEASE_GPG_KEY` for signing.  
- **trigger-artifact-mirror.yml**: Triggers an external artifact mirroring system. Requires `MIRROR_API_TOKEN`.  
<!-- AI:end:ci -->

## Mirror chain

<!-- AI:start:mirror-chain -->
This repo is maintained in [`Interested-Deving-1896/xanmod-unified-kernel`](https://github.com/Interested-Deving-1896/xanmod-unified-kernel) and mirrored through:

```
Interested-Deving-1896/xanmod-unified-kernel  ──►  OpenOS-Project-OSP/xanmod-unified-kernel  ──►  OpenOS-Project-Ecosystem-OOC/xanmod-unified-kernel
```

Changes flow downstream automatically via the hourly mirror chain in
[`fork-sync-all`](https://github.com/Interested-Deving-1896/fork-sync-all).
Direct commits to OSP or OOC are detected and opened as PRs back to `Interested-Deving-1896`.
<!-- AI:end:mirror-chain -->

## Contributors

<!-- AI:start:contributors -->
[@Interested-Deving-1896](https://github.com/Interested-Deving-1896): 32 commits

*Note: This repository is a mirror. Please refer to the upstream source for additional contributions and updates.*
<!-- AI:end:contributors -->

## Origins

<!-- AI:start:origins -->
_No dependency graph found. Run `generate-dep-graph.yml` to generate `dep-graph/origins.md`._
<!-- AI:end:origins -->

## Resources

<!-- AI:start:resources -->
_No additional resource files found._
<!-- AI:end:resources -->

## License

<!-- AI:start:license -->
<!-- License not detected — add a LICENSE file to this repo. -->
<!-- AI:end:license -->
