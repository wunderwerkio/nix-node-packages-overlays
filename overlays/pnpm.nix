final: prev: let
  version = "12.15.0";
  sha256 = "sha256-9Rc/YSfMUFzbNuwXcZ/lSoURxv2FYMfOtL98c+O0RYs=";
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
