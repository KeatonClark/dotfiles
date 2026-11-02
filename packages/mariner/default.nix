{
  inputs,
  ...
}:
{
  flake.modules.homeManager.mariner = {
    imports = [
      inputs.nixvim.homeModules.nixvim
    ];
    programs.nixvim = {
      imports = with inputs.self.modules.nixvim; [
        mariner
      ];
      config = {
        enable = true;
      };
    };
  };
  flake.modules.nixvim.mariner = {
    imports = [
      ./remaps.nix
      ./plugins
    ];
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
          event = [
            "CursorHold"
            "CursorHoldI"
          ];
          pattern = [ "*" ];
          command = "lua vim.diagnostic.open_float(nil, {focus=false})";
        }
      ];
      globals = {
        mapleader = " ";
      };
    };
  };
  perSystem = { pkgs, system, ... }: {
    packages.mariner = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
      module = inputs.self.modules.nixvim.mariner;
    };
  };
}
