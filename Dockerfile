FROM nixos/nix:latest

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update
RUN nix-env -f '<nixpkgs>' -iA bash jekyll sile gnumake

WORKDIR /site

ENTRYPOINT bash
