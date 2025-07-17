{ config, pkgs, ... }:
{
  users.users.${config.user}.shell = pkgs.zsh;
  programs.zsh.enable = true;
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      direnv
    ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      envExtra = ''
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
        ZSH_AUTOSUGGEST_STRATEGY=(completion history)
        eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
        theme = "duellj";
      };
    };
  };
}
