{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    # Notice the reference to nixpkgs here.
    # with import nixpkgs { system = "x86_64-linux"; };
    flake-utils.lib.eachDefaultSystem (system:
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.stdenv.mkDerivation rec {
          name = "lib1";
          src = self;
          version = "git";
          buildInputs = with pkgs; [ cmake gcc ];
          configurePhase = "cmake -S $src -B build -DCMAKE_INSTALL_PREFIX=$out";
          buildPhase = "cmake --build build";
          # installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
          installPhase = "cmake --install build";
        };
      });
      # in {
      #   packages.hello = pkgs.hello;
      #
      #   devShell = pkgs.mkShell { buildInputs = [ pkgs.hello pkgs.cowsay ]; };
}
