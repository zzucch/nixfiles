{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    specialArgsCommon = {
      inherit inputs;
      abs = path: ./. + ("/" + path);
    };
    system = "x86_64-linux";
    mkNixosSystem = {
      system,
      modules ? [],
      specialArgs ? {},
    }: let
      specialArgsMerged =
        specialArgs
        // specialArgsCommon
        // {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config = {allowUnfree = true;};
          };
        };
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          [
            inputs.nixvim.nixosModules.nixvim
            home-manager.nixosModules.home-manager
            {home-manager.extraSpecialArgs = specialArgsMerged;}
          ]
          ++ modules;
        specialArgs = specialArgsMerged;
      };
  in {
    nixosConfigurations = {
      dennou = mkNixosSystem {
        inherit system;
        modules = [
          ./hosts/dennou/configuration.nix
        ];
      };
    };
  };
}
