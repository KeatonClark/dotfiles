{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs = {
      ssh = {
        enable = true;
      };
      git = {
        enable = true;
        settings.user = {
          email = config.email;
          name = config.fullName;
        };
      };
      difftastic = {
        git.enable = true;
        enable = true;
      };
    };
  };
}
