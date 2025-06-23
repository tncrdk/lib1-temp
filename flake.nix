{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      # with import nixpkgs { system = "x86_64-linux"; };
      in
        pkgs.stdenv.mkDerivation rec {
            name = "lib1";
            src = self;
            buildInputs = with pkgs; [ cmake gcc ];
            configurePhase = "cmake -S $src -B build -DCMAKE_INSTALL_PREFIX=$out";
            buildPhase = "cmake --build build";
            # installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
            installPhase = "cmake --install build";
        };
  };
}
