final: prev: let
  version = "9.15.1";
  sha256 = "sha256-nlNOcK/vBjdPYSa0S9pXYJRxNc4WowrvEBDpZft+Pj4=";
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
