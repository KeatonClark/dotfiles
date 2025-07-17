{ ... }:
{
  plugins = {
    which-key = {
      enable = true;
      settings = {
        expand = 1;
        replace = {
          desc = [
            [
              "<space>"
              "SPACE"
            ]
            [
              "<leader>"
              "SPACE"
            ]
          ];
        };
        spec = [
          {
            __unkeyed = "<leader>f";
            group = "Find";
          }
          {
            __unkeyed = "<leader>g";
            group = "Git";
          }
          {
            __unkeyed = "<leader>l";
            group = "LSP";
          }
          {
            __unkeyed = "<leader>h";
            group = "Help!";
          }
        ];
        triggers_no_wait = ["" "'" "g" "g'" "\"" "<c-r>" "z=" "<leader>"];
      };
    };
  };
  keymaps = [
    {
      action = "<cmd>ClangdSwitchSourceHeader<cr>";
      key = "<leader><Tab>";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Source/Header";
      };
    }
    {
      action = "<cmd>bn<cr>";
      key = "<Tab>";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Next Buffer";
      };
    }
    {
      action = "<cmd>bp<cr>";
      key = "<S-Tab>";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Prev Buffer";
      };
    }
  ];
}
