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
    dotfiles-config.url = "path:./templates/dotfiles-config";
  };

  outputs = inputs@{ nixpkgs, utils, nixvim, dotfiles-config, ... }: {
    # Define nixosConfigurations here as well
    nixosConfigurations = {
      hardtack = import ./hosts/hardtack { inherit inputs dotfiles-config; };
    };

    # Use eachDefaultSystem only for system-dependent outputs
    packages = 
    {
      "x86_64-linux".mariner = nixvim.legacyPackages."x86_64-linux".makeNixvimWithModule {
        module = import ./packages/mariner;
      };
    };
    templates = {
      rust = {
        path = ./templates/rust;
        description = "Cross compiling rust flake";
        welcomeText = "Rust flake created";
      };
      dotfiles-config = {
        path = ./templates/dotfiles-config;
        description = "configuration for these dotfiles";
        welcomeText = "Don't forget to modify the values in flake.nix";
      };
    };
  };
}
