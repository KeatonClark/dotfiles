{ ... }:
{
  plugins = {
    treesitter.enable = true;
    treesitter-context.enable = true;
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
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
}
