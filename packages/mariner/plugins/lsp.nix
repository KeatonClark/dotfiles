{ ... }:
{
  plugins = {
    treesitter.enable = true;
    treesitter-context.enable = true;
    lsp = {
      enable = true;
      servers = {
        clangd = {
          enable = true;
          package = null;
        };
        bashls.enable = true;
        cmake.enable = true;
        dockerls.enable = true;
        lua_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
        };
        nil_ls.enable = true;
        marksman.enable = true;
        texlab.enable = true;
        pylsp.enable = true;
      };
    };
  };
  keymaps = [
    {
      action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      key = "<leader>ln";
      mode = ["n"];
      options = {
        silent = true;
        desc = "reName";
      };
    }
  ];
}
