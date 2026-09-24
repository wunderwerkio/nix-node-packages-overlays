final: prev: let
  version = "12.6.0";
  sha256 = "sha256-Bbe5IfuzFWRQXJZ+q/gliVocwY9Qk1wAvpiBUnLMnVY=";
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
