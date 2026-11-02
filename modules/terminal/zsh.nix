{
  ...
}:
{
  flake.modules.homeManager.zsh =
    { ... }:
    {
      programs = {
        direnv = {
          enable = true;
          enableZshIntegration = true;
        };
        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion = {
            enable = true;
            strategy = [
              "completion"
              "history"
            ];
            highlight = "fg=4";
          };
          syntaxHighlighting.enable = true;
          oh-my-zsh = {
            enable = true;
            plugins = [
              "git"
            ];
            theme = "duellj";
          };
          shellAliases = { };
        };
      };
    };
}
