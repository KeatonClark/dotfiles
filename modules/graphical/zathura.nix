{ config, pkgs, lib, ... }:
{
  home-manager.users.${config.user} = {
    xdg = {
      enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        };
      };
    };
    programs.zathura = {
      enable = true;
    };
  };
}
