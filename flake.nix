{
  nixConfig = {
    extra-substituters = [ "https://leana8959.cachix.org" ];
    extra-trusted-substituters = [ "https://leana8959.cachix.org" ];
    extra-trusted-public-keys = [
      "leana8959.cachix.org-1:CxQSAp8lcgMv8Me459of0jdXRW2tcyeYRKTiiUq8z0M="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs."nixpkgs".follows = "nixpkgs";
      inputs."nixpkgs-stable".follows = "nixpkgs";
    };

    flakies.url = "git+https://codeberg.org/leana8959/flakies";

    typst-packages = {
      url = "github:typst/packages";
      flake = false;
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      imports = [
        ./nix/pre-commit
        inputs.flakies.flakeModules.typstLib
      ];

      perSystem =
        {
          pkgs,
          config,
          typstLib,
          ...
        }:
        {
          formatter = pkgs.nixfmt-rfc-style;

          devShells.default = typstLib.typstDevShell.overrideAttrs {
            shellHook = config.pre-commit.installationScript;
          };
        };
    };
}
