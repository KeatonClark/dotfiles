{
  description = "Cross platform rust flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils, ... }: utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShell = let
      targetNames = {
        mingw = "x86_64-w64-mingw32";
        musl = "x86_64-unknown-linux-musl";
      };

      pkgsCross = builtins.mapAttrs (name: value: import pkgs.path {
        system = system;
        crossSystem = {
          config = value;
        };
      }) targetNames;
      
      ccPkgs = builtins.mapAttrs (name: value: value.stdenv.cc) pkgsCross;
      cc = builtins.mapAttrs (name: value: "${value}/bin/${targetNames.${name}}-cc") ccPkgs;
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        rustup
        gdb
        cargo
        rustfmt
      ] ++ builtins.attrValues ccPkgs;
      
      CARGO_BUILD_TARGET = let
        toolchainStr = builtins.readFile ./rust-toolchain.toml;
        targets = (builtins.fromTOML toolchainStr).toolchain.targets;
      in builtins.head targets;

      CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER = cc.musl;
      CARGO_TARGET_X86_64_PC_WINDOWS_GNU_LINKER = cc.mingw;

      CC_x86_64_unknown_linux_musl = cc.musl;
      CC_x86_64_pc_windows_gnu = cc.mingw;
      RUSTFLAGS = builtins.map (a: "-L ${a}/lib") [
        pkgsCross.mingw.windows.mingw_w64_pthreads
      ];

      shellHook = ''
        export RUSTUP_HOME=$(pwd)/.rustup/
        export CARGO_HOME=$(pwd)/.cargo/

        export PATH=$PATH:$CARGO_HOME/bin

        rustup show
        echo cargo build --target x86_64-pc-windows-gnu
        echo cargo build --target x86_64-unknown-linux-musl
      '';

    };  
  });
}
