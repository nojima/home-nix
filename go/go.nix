{
  stdenv,
  version,
  sha256,
}:
  assert stdenv.system == "x86_64-linux";
  stdenv.mkDerivation {
    pname = "go";
    version = version;
    src = builtins.fetchTarball {
      url = "https://go.dev/dl/go${version}.linux-amd64.tar.gz";
      sha256 = sha256;
    };

    buildPhase = "";
    installPhase = ''
      mkdir -p $out
      cp -r -T . $out
    '';

    meta = {
      description = "Go Programming language";
      mainProgram = "go";
    };
  }
