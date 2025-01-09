# home-nix

1. [Install Nix with flakes enabled](https://github.com/DeterminateSystems/nix-installer).
2. Run `mkdir -p ~/.config && git clone git@github.com:nojima/home-nix ~/.config/home-manager`.
3. Run `nix run home-manager/master -- init --switch -b backup`

