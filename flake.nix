{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {


    packages.x86_64-linux.default = self.packages.x86_64-linux.test;
    packages.x86_64-linux.test = (pkgs.callPackage "${nixpkgs}/nixos/tests/nextcloud/default.nix" {inherit pkgs;}).basic30;

  };
}
