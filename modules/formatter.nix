{
  inputs,
  ...
}:
let
  pkgs = import inputs.nixpkgs {
    system = "x86_64-linux";
  };
in
{
  flake.formatter.x86_64-linux = pkgs.nixfmt-tree;
}
