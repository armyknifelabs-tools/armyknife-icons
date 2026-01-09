{
  description = "Icons for the Armyknife desktop environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        nativeBuildInputs = [ just ];
        name = "armyknife-icons";
        src = self;
        installPhase = "just prefix=$out install";
      };

  };
}
