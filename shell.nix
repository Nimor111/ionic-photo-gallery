let
  pkgs = import <nixpkgs> {};
  node_packages = import ./default.nix { inherit (pkgs) nodejs; };
  cordova-res = (import ./override.nix {}).cordova-res;
in
pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
    pkgs.nodePackages.node2nix
    node_packages."@ionic/cli"
    node_packages.native-run
    cordova-res
  ];
}
