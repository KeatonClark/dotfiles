{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs = {
      ssh = {
        enable = true;
      };
      git = {
        enable = true;
        userEmail = config.email;
        userName = config.fullName;
        difftastic = {
          enable = true;
        };
      };
    };
  };
}
