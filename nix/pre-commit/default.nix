{ inputs, ... }:
{
  imports = [ inputs.pre-commit-hooks.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      # https://github.com/cachix/git-hooks.nix
      pre-commit = {
        check.enable = true;
        settings.hooks = {
          nixfmt.enable = true;
          nixfmt.package = pkgs.nixfmt-rfc-style;
          statix.enable = true;
          deadnix.enable = true;

          typstyle.enable = true;
        };
      };
    };
}
