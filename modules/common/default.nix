{ config, lib, pkgs, ... }: {
  options = {
    stateVersion = lib.mkOption {
      type = lib.types.str;
      description = "State Version";
    };
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };
    hashedPassword = lib.mkOption {
      type = lib.types.str;
      description = "Password built with mkpasswd for the user";
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
    ai.enable = lib.mkEnableOption {
      default = false;
      description = "Enable ollama and locally hosted models";
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
    users = {
      mutableUsers = false;
      users.${config.user} = {
        isNormalUser = true;
        group = config.group;
        extraGroups = [
          "wheel"
        ];
        hashedPassword = config.hashedPassword;
      };
    };
    users.groups.${config.user} = {};
    system.stateVersion = config.stateVersion;
    home-manager.users.${config.user}.home.stateVersion = config.stateVersion;
    home-manager.users.root.home.stateVersion = config.stateVersion;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [
    ../shell
  ];
}
