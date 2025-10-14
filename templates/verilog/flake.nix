{
  description = "verilog template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { utils, self, nixpkgs }: utils.lib.eachDefaultSystem (system: 
  let
    pkgs = (import nixpkgs { inherit system; });
  in
  {
    packages.default = self.packages.${system}.verilog-template;
    packages.verilog-template = pkgs.callPackage ./. { };
    
    devShells.default = pkgs.mkShell {
      inputsFrom = [ self.packages.${system}.verilog-template ];
      buildInputs = with pkgs; [
        clang-tools
        gtkwave
      ];
    };
  });
}
