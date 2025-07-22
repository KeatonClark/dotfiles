{ pkgs, ... }:
{
  imports = [
    ./telescope.nix   
    ./lsp.nix
    ./git.nix
    ./cmp.nix
  ];
  plugins = {
    auto-save.enable = true;
    web-devicons.enable = true;
    tmux-navigator.enable = true;
    bufferline = {
      enable = true;
      settings.options.diagnostics = "nvim_lsp";
    };
    lualine.enable = true;
    noice.enable = true;
  };
  colorschemes.gruvbox.enable = true;
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = neoscroll-nvim;
      config = ''
        lua << EOF
          require("neoscroll").setup()
        EOF
      '';
    }
    {
      plugin = vim-sleuth;
    }
  ];
}
