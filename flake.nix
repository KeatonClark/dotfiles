{
  description = "System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = { 
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, utils, nixvim, ... }: {
    # Define nixosConfigurations here as well
    nixosConfigurations = {
      hardtack = import ./hosts/hardtack { inherit inputs; };
    };

    # Use eachDefaultSystem only for system-dependent outputs
    packages = 
    {
      "x86_64-linux".mariner = nixvim.legacyPackages."x86_64-linux".makeNixvimWithModule {
        module = import ./packages/mariner;
      };
    };
  };
}
