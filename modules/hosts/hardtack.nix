{
  inputs,
  lib,
  ...
}:
{
  options.flake.factory = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = { };
  };
  config = {
  flake.nixosConfigurations.hardtack = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self; [
      inputs.wsl.nixosModules.wsl
      inputs.home-manager.nixosModules.home-manager
      (factory.dev { username = "kc"; })
      (factory.admin { username = "kc"; })
      ({ ... }: {
        config = {
          system = {
            stateVersion = "26.11";
          };
          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;
            users.kc.home.stateVersion = "26.11";
          };
          nix.settings.experimental-features = [
            "nix-command"
            "flakes"
          ];
          virtualisation.vmVariant = {
            virtualisation = {
              memorySize = 8192;
              cores = 4;
            };
          };
          /*
            wsl = {
              enable = true;
              usbip = {
                enable = true;
              };
            };
          */
        };
      })
    ];
  };
  };
}
