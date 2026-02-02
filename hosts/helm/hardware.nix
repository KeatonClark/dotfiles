{ ... }: {
  imports = [
    ./disks.nix
    ./boot.nix
  ];
  hardware = {

  };
  virtualisation.virtualbox.guest = {
    enable = true;
    clipboard = true;
    seamless = true;
  };
}
