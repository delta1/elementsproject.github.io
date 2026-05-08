{
  description = "elementsproject.org Jekyll site";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ruby_3_3
            bundler
            libxml2
            libxslt
            zlib
            openssl
            gnumake
            gcc
            pkg-config
          ];

          shellHook = ''
            export BUNDLE_PATH="$PWD/.bundle"
            export GEM_HOME="$PWD/.gems"
            export PATH="$GEM_HOME/bin:$PATH"
            export NOKOGIRI_USE_SYSTEM_LIBRARIES=true
            bundle config set --local path '.bundle'
          '';
        };
      });
    };
}
