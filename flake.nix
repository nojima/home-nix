{
  description = "Home Manager configuration of nojima";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      # Go関連のツールを指定したバージョンのものに差し替える
      goOverlay = self: super: {
        go = super.callPackage ./go/go.nix {
          version = "1.23.4";
          sha256 = "1y0vq1nxjzk0qabdkfh31kasnz2xafk9g24mq5aaf2wx15f306j2";
        };
        gotools = self.callPackage ./go/gotools.nix {
          version = "0.29.0";
          hash = "sha256-h3UjRY1w0AyONADNiLhxXt9/z7Tb/40FJI8rKGXpBeM=";
          vendorHash = "sha256-5JE4/2yn5emRuq4wGTeNnAJa+QZayDq2n+dL3gMML/M=";
        };
        gopls = self.callPackage ./go/gopls.nix {
          version = "0.17.1";
          hash = "sha256-NLUIFNooOOA4LEL5nZNdP9TvDkQUqLjKi44kZtOxeuI=";
          vendorHash = "sha256-wH3YRiok3YWNzw9ejXMMitq58SxrNWXiKYKz2Hf0ZlM=";
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ goOverlay ];
      };
    in {
      homeConfigurations."nojima" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
