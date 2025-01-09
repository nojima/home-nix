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
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      # 仕事用の flake からインポートするために home.nix などをエクスポートしておく
      exports = {
        homeModule = import ./home.nix;
        inherit pkgs;
        inherit home-manager;
      };

      homeConfigurations."nojima" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ exports.homeModule ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
