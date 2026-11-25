# Derive from Nix image
FROM docker.io/nixos/nix

# Enable flakes
ENV NIX_CONFIG="experimental-features = nix-command flakes"

# Install Spindle and helper tools for MicroVMs
RUN nix profile add "git+https://tangled.org/tangled.org/core#spindle" \
    nixpkgs#git \
    nixpkgs#qemu_kvm \
    nixpkgs#e2fsprogs \
    nixpkgs#slirp4netns \
    nixpkgs#iproute2 \
    nixpkgs#util-linux \
    nixpkgs#kmod
 && nix-collect-garbage -d

# Expose default port
EXPOSE 6555

# Set spindle as entrypoint, voilà!
ENTRYPOINT ["spindle"]
