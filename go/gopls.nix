{
  lib,
  buildGoModule,
  fetchFromGitHub,
  version,
  hash,
  vendorHash,
}:

buildGoModule {
  pname = "gopls";
  version = version;

  src = fetchFromGitHub {
    owner = "golang";
    repo = "tools";
    rev = "gopls/v${version}";
    hash = hash;
  };

  modRoot = "gopls";
  vendorHash = vendorHash;

  # https://github.com/golang/tools/blob/9ed98faa/gopls/main.go#L27-L30
  ldflags = [ "-X main.version=v${version}" ];

  doCheck = false;

  # Only build gopls, and not the integration tests or documentation generator.
  subPackages = [ "." ];

  meta = with lib; {
    description = "Official language server for the Go language";
    homepage = "https://github.com/golang/tools/tree/master/gopls";
    changelog = "https://github.com/golang/tools/releases/tag/${src.rev}";
    license = licenses.bsd3;
    mainProgram = "gopls";
  };
}
