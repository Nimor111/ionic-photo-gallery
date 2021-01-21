{pkgs ? import <nixpkgs> {
    inherit system;
}, system ? builtins.currentSystem}:

let
  nodePackages = import ./default.nix {
    inherit pkgs system;
  };
in
nodePackages // {
  cordova-res = nodePackages.cordova-res.override {
    buildInputs = [ pkgs.vips pkgs.pkg-config ];
  };
}
