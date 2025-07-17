{ config, inputs, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./tmux.nix
  ];
  config = {
    home-manager.users.${config.user} = {
      home.packages = with pkgs; [
        inputs.self.packages.${pkgs.system}.mariner
        bat
        jq
        fzf
        socat
        htop-vim
      ];
    };
  };
}
