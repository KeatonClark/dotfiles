{ inputs, ... }:
let
  user = "kc";
  fullName = "Keaton Clark";
  timeZone = "America/Los_Angeles";
  system = "x86_64-linux";
  stateVersion = "25.11";
  email = "root@keatonclark.dev";
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
