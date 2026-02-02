{ inputs, dotfiles-config, ... }:
let
  user = dotfiles-config.user.user;
  group = dotfiles-config.user.group;
  fullName = dotfiles-config.user.fullName;
  timeZone = dotfiles-config.user.timeZone;
  system = dotfiles-config.user.system;
  stateVersion = dotfiles-config.user.stateVersion;
  email = dotfiles-config.user.email;
  hashedPassword = dotfiles-config.user.hashedPassword;
in inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs stateVersion;
  };
  modules = [
    ../../modules/common
    inputs.home-manager.nixosModules.home-manager
    ./hardware.nix
    {
      user = user;
      group = group;
      timeZone = timeZone;
      fullName = fullName;
      email = email;
      stateVersion = stateVersion;
      hashedPassword = hashedPassword;
      nixpkgs.hostPlatform = system;
      gui.enable = true;
    }
  ];
}
