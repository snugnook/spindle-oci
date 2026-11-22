# Derive from Nix image
FROM docker.io/nixos/nix

# Enable flakes
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

# Install Spindle
RUN nix profile install "git+https://tangled.org/tangled.org/core#spindle"

# Set spindle as entrypoint, voilà!
ENTRYPOINT ["spindle"]
