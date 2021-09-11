FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-build -A bash '<nixpkgs>'

# RUN nix-env -f '<nixpkgs>' -iA bash gnumake
# RUN nix-env -f '<nixpkgs>' -iA github-pages
# RUN nix-env -f '<nixpkgs>' -iA sile
# RUN nix-env -f '<nixpkgs>' -iA imagemagick

WORKDIR /site

# ENTRYPOINT bash
