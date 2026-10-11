final: prev: let
  version = "12.11.2";
  sha256 = "sha256-61c0G4tU/dru3tsV27d8wwoRdQzsyjAb/aAkeP3/OgA=";
  lib = import ../lib {pkgs = prev;};
in
  lib.overlayNodePackages {
    pnpm-latest = prev.nodePackages.pnpm.override {
      inherit version;
      src = prev.fetchurl {
        inherit sha256;

        url = "https://registry.npmjs.org/pnpm/-/pnpm-${version}.tgz";
      };
    };
  }
