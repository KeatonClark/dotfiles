{ config, inputs, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  services.ollama = {
    enable = true;
    acceleration = "cuda";
    loadModels = [ 
      "llama3.2:3b"
      "qwen2.5-coder:3b" 
      "qwen2.5-coder:7b" 
    ];
    environmentVariables = {
      CUDA_PATH = "${pkgs.cudatoolkit}";
      EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
      EXTRA_CCFLAGS = "-I/usr/include";
      LD_LIBRARY_PATH = builtins.concatStringsSep ":" [ 
        "/usr/lib/wsl/lib"
        "${pkgs.linuxPackages.nvidia_x11}/lib"
        "${pkgs.ncurses}/lib" 
      ];
      MESA_D3D12_DEFAULT_ADAPTER_NAME = "Nvidia";
    };
  };
  hardware.nvidia-container-toolkit = {
    enable = true;
    mount-nvidia-executables = false;
  };
}
