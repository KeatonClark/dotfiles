{ ... }:
{
  config = {
    viAlias = true;
    opts = {
      number = true;
      wrap = false;
      relativenumber = true;
      cursorline = true;
      updatetime = 250;
    };
    autoCmd = [
      {
        event = [ "CursorHold" "CursorHoldI" ];
        pattern = [ "*" ];
        command = "lua vim.diagnostic.open_float(nil, {focus=false})";
      }
    ];
    globals = {
      mapleader = " ";
    };
  };
}
