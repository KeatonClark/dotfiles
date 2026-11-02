{ ... }:
{
  flake.factory.admin =
    {
      username,
    }:
    { ... }: {
      config = {
        users.users.${username} = {
          extraGroups = [ "wheel" ];
        };
      };
    };
}
