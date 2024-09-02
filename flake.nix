{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };
  outputs = { systems, nixpkgs, ... }:
    let
      eachSystem = f:
        nixpkgs.lib.genAttrs (import systems)
        (system: f nixpkgs.legacyPackages.${system});
    in {
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gnumake
            gnutar
            zip
            haskell-language-server
            ormolu
            nixfmt
            statix
            deadnix
            jq
            haskell.compiler.ghc98
            haskellPackages.cabal-install
          ];
        };
      });
    };
}
