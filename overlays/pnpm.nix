final: prev: let
  version = "12.4.2";
  sha256 = "sha256-O7FoPHv/i/ioEChNizivRqwi4qcy/KiN4pn9xriK+BQ=";
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
