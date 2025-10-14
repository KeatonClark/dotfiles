{
  stdenv,
  verilator,
  cpputest,
  cmake,
}:
stdenv.mkDerivation {
  name = "verilog template";
  version = "0.0.1";
  src = ./.;
  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    verilator
    cpputest
  ];
}
