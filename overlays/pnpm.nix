final: prev: let
  version = "12.18.0";
  sha256 = "sha256-KdHX2Zv27G0KPbsOxWVvDRbpl+i+Z2ykXFgdEctx91M=";
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
