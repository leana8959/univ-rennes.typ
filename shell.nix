{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShellNoCC {
  packages = [
    pkgs.typst
    pkgs.tinymist
    pkgs.typstyle
    pkgs.just
  ];
}
