{ config, lib, pkgs, ... }: {

  imports = [
    ../shell
    ../ai
  ];

  options = {
    stateVersion = lib.mkOption {
      type = lib.types.str;
      description = "State Version";
    };
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };
    fullName = lib.mkOption {
      type = lib.types.str;
      description = "Full name";
    };
    email = lib.mkOption {
      type = lib.types.str;
      description = "Email to use for git and such";
    };
    timeZone = lib.mkOption {
      type = lib.types.str;
      description = "System time zone";
    };
    gui.enable = lib.mkEnableOption {
      default = false;
      description = "Enable Graphics";
    };
  };

  config = {
    time.timeZone = config.timeZone;

    # Use System level packages
    home-manager.useGlobalPkgs = true;

    virtualisation.docker.enable = true;
    
    # Install packages to /etc/profiles
    home-manager.useUserPackages = true;
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "google-chrome"
      "discord"
      "cuda-cudart"
    ];

    system.stateVersion = config.stateVersion;
    home-manager.users.${config.user}.home.stateVersion = config.stateVersion;
    home-manager.users.root.home.stateVersion = config.stateVersion;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
