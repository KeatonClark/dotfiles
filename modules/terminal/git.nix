{ ... }:
{
  flake.factory.git = {
    email,
    name,
  }:
  { ... }: {
    programs = {
      git = {
        enable = true;
        settings.user = {
          inherit email name;
        };
      };
      difftastic = {
        git.enable = true;
        enable = true;
      };
    };
  };
}
