{
  lib,
  buildGoModule,
  fetchFromGitHub,
  version,
  hash,
  vendorHash,
}:

buildGoModule {
  pname = "gotools";
  version = version;

  # using GitHub instead of https://go.googlesource.com/tools because Gitiles UI is to basic to browse
  src = fetchFromGitHub {
    owner = "golang";
    repo = "tools";
    rev = "v${version}";
    hash = hash;
  };

  postPatch = ''
    # The gopls folder contains a Go submodule which causes a build failure
    # and lives in its own package named gopls.
    rm -r gopls
  '';

  vendorHash = vendorHash;

  doCheck = false;

  # Set GOTOOLDIR for derivations adding this to buildInputs
  postInstall = ''
    mkdir -p $out/nix-support
    substitute ${./setup-hook.sh} $out/nix-support/setup-hook \
      --subst-var-by bin $out
  '';

  meta = with lib; {
    description = "Additional tools for Go development";
    longDescription = ''
      This package contains tools like: godoc, goimports, callgraph, digraph, stringer or toolstash.
    '';
    homepage = "https://go.googlesource.com/tools";
    license = licenses.bsd3;
  };
}
