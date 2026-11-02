{ ... }:
{
  plugins = {
    neogit.enable = true;
    gitsigns.enable = true;
  };
  keymaps = [
    {
      action = "<cmd>lua require('gitsigns').blame()<cr>";
      key = "<leader>gbb";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Blame Buffer";
      };
    }
    {
      action = "<cmd>lua require('gitsigns').blame_line()<cr>";
      key = "<leader>gbl";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Blame Line";
      };
    }
    {
      action = "<cmd>lua require('gitsigns').stage_hunk()<cr>";
      key = "<leader>gah";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Add Hunk";
      };
    }
    {
      action = "<cmd>lua require('gitsigns').stage_buffer()<cr>";
      key = "<leader>gaf";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Add File";
      };
    }
    {
      action = "<cmd>lua require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })<cr>";
      key = "<leader>gah";
      mode = ["v"];
      options = {
        silent = true;
        desc = "Add Hunk";
      };
    }
    {
      action = "<cmd>lua require('gitsigns').reset_buffer()<cr>";
      key = "<leader>grf";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Reset File";
      };
    }
    {
      action = "<cmd>lua require('gitsigns').reset_hunk()<cr>";
      key = "<leader>grh";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      action = "<cmd>lua require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })<cr>";
      key = "<leader>grh";
      mode = ["v"];
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      action = "<cmd>lua require('neogit').open({kind = 'floating'})<cr>";
      key = "<leader>go";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Open";
      };
    }
    {
      action = "<cmd>Neogit fetch<cr>";
      key = "<leader>gf";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Fetch";
      };
    }
    {
      action = "<cmd>Neogit push<cr>";
      key = "<leader>gp";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Push";
      };
    }
    {
      action = "<cmd>Neogit push<cr>";
      key = "<leader>gp";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Push";
      };
    }
    {
      action = "<cmd>Neogit pull<cr>";
      key = "<leader>gu";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Pull";
      };
    }
    {
      action = "<cmd>Neogit commit<cr>";
      key = "<leader>gc";
      mode = ["n"];
      options = {
        silent = true;
        desc = "Commit";
      };
    }
  ];
}
