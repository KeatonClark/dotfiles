{ config, pkgs, ... }: {
  home-manager.users.${config.user} = {
    home.sessionVariables = {
      TERMINAL = "alacritty";
    };
    programs.alacritty = {
      enable = true;
      theme = "gruvbox_dark";
      settings = {
        font = {
          normal = {
            family = "FiraCode Nerd Font Mono";
            style = "Regular";
          };
          bold = {
            family = "FiraCode Nerd Font Mono";
            style = "Bold";
          };
          italic = {
            family = "FiraCode Nerd Font Mono";
            style = "Italic";
          };
          bold_italic = {
            family = "FiraCode Nerd Font Mono";
            style = "Bold Italic";
          };
        };
      };
    };
  };
}
