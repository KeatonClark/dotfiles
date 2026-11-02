{ inputs, ... }:
{
  flake.factory.dev =
    {
      username,
      git_name,
      git_email,
    }:
    { pkgs, ... }: {
      config = {
        programs.zsh.enable = true;
        users.users.${username} = {
          initialPassword = "password";
          isNormalUser = true;
          shell = pkgs.zsh;
        };
        home-manager.users.${username} = {
          programs = {
            bat.enable = true;
            jq.enable = true;
          };
          home.packages = with pkgs; [
            socat
          ];
          imports = with inputs.self.modules.homeManager; [
            tmux
            zsh
            (inputs.self.factory.git { name = git_name; email = git_email; })
            mariner
          ];
        };
      };
    };
}
