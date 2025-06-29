{
  description = "SM64 Vita Port";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    vitasdk = {
      url = "github:sleirsgoevy/vitasdk.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      vitasdk,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShell.${system} = pkgs.mkShell {
        packages = [
          pkgs.git
          pkgs.pkg-config
          vitasdk.packages.${system}.vitasdk
        ];
      };
    };
}
