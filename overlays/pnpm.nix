final: prev: let
  version = "8.12.1";
  sha256 = "sha256-VT5OsOKiyavLQZsyYr3HruiuPELiMBoYB9RFdXhhYMk=";
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
