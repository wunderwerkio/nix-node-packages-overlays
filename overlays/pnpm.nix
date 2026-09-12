final: prev: let
  version = "12.4.1";
  sha256 = "sha256-YnYpjpr1dren9ekES/r74meCCSUM0QsXBepdOqZNSII=";
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
