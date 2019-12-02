with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    bashInteractive
    haskellPackages.pandoc
    haskellPackages.pandoc-sidenote
  ];
}
