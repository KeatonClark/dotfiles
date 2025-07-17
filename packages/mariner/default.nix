{ ... }: {
  imports = [
    ./configuration.nix # basic configuration
    ./remaps.nix        # key remaps
    ./plugins           # plugins
  ];
}
