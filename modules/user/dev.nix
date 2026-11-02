{ inputs, ... }:
{
  flake.factory.dev =
    {
      username,
    }:
    { ... }: {
      config = {
        users.users.${username} = {
          initialPassword = "password";
          isNormalUser = true;
        };
        home-manager.users.${username} = {
          imports = with inputs.self.modules.homeManager; [
            tmux
          ];
        };
      };
    };
}
