{ config, inputs, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./git.nix
  ];
  config = {
    home-manager.users.${config.user} = {
      home.packages = with pkgs; [
        inputs.self.packages.${pkgs.system}.mariner
        bat
        jq
        socat
      ];
    };
  };
}
