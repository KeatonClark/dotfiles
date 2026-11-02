{ pkgs, ... }:
{
  plugins = {
    telescope = {
      enable = true;
      settings = {
        pickers = {
          find_files = {
            hidden = true;
          };
        };
      };
    };
  };
  extraPackages = with pkgs; [
    ripgrep
  ];
  keymaps = [
    {
      action = "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>";
      key = "<leader>ls";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Symbols";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>";
      key = "<leader>ld";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Definitions/Declarations";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').lsp_references()<cr>";
      key = "<leader>lr";
      mode = ["n"];
      options = {
        silent = true;
        desc = "References";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').marks()<cr>";
      key = "<leader>fm";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Find Marks";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').grep_string()<cr>";
      key = "<leader>fw";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Find Word Under Cursor";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').jumplist()<cr>";
      key = "<leader>fj";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Jumps";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').buffers()<cr>";
      key = "<leader>fb";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Find Buffer";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').live_grep()<cr>";
      key = "<leader>fs";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Find String";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').find_files()<cr>";
      key = "<leader>ff";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Find Files";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').keymaps()<cr>";
      key = "<leader>hk";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Keymaps";
      };
    }
    {
      action = "<cmd>lua require('telescope.builtin').man_pages()<cr>";
      key = "<leader>hm";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Man Pages";
      };
    }
  ];
}
