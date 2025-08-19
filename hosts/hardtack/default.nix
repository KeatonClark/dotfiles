{ inputs, dotfiles-config, ... }:
let
  user = dotfiles-config.user.user;
  fullName = dotfiles-config.user.fullName;
  timeZone = dotfiles-config.user.timeZone;
  system = dotfiles-config.user.system;
  stateVersion = dotfiles-config.user.stateVersion;
  email = dotfiles-config.user.email;
in inputs.nixpkgs.lib.nixosSystem {
  specialArgs = { 
    inherit inputs stateVersion;
  };
  modules = [
    ../../modules/common
    inputs.home-manager.nixosModules.home-manager
    inputs.wsl.nixosModules.wsl
    {
      user = user;
      timeZone = timeZone;
      fullName = fullName;
      email = email;
      stateVersion = stateVersion;
      nixpkgs.hostPlatform = system;
      wsl = {
        useWindowsDriver = true;
        enable = true;
        wslConf.automount.root = "/mnt";
        defaultUser = user;
        wslConf.network.generateResolvConf = true;
      };
    }
  ];
}
