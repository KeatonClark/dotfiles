{ pkgs, ... }:
{
  opts = {
    spell = true;
    spelllang = [ "en_us" ];
  };
  extraPackages = with pkgs; [
    ripgrep
  ];
  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-tmux.enable = true;
    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
    luasnip.enable = true;
    cmp-rg.enable = true;
    cmp-spell.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "tmux"; }
          { name = "buffer"; }
          { name = "rg"; }
          { name = "spell"; }
        ];
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end'';
        mapping = {
          "<Enter>" = ''function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
              cmp.confirm {
                select = true
              }
            else
              fallback()
            end
          end'';
          "<Tab>" = '' function(fallback)
            if cmp.visible() then
              cmp.select_next_item({behavior = cmp.SelectBehavior.Insert}) 
            else
              fallback()
            end
          end'';
          "<S-Tab>" = '' function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
            else
              fallback()
            end
          end'';
        };
        experimental = {
          ghost_text = true;
        };
      };
    };
  };
}
