final: prev: let
  version = "9.5.0";
  sha256 = "sha256-299ZYcMpCfsDBZWp2qHa5yAWLmWGCaj5Ly+pmDVRDKU=";
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
