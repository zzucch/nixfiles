{
  description = "system flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    nix-darwin,
    nixvim,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    specialArgsCommon = {
      inherit inputs;
      abs = path: ./. + ("/" + path);
    };
    system = "x86_64-linux";
    supportedSystems = [system];
    forEachSupportedSystem = f:
      inputs.nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import inputs.nixpkgs {
            inherit system;
          };
        });
    mkDarwinSystem = {
      modules ? [],
      specialArgs ? {},
    }: let
      specialArgsMerged =
        specialArgs
        // specialArgsCommon
        // {
          pkgs-stable = import nixpkgs-stable {
            config = {allowUnfree = true;};
          };
        };
    in
      nix-darwin.lib.darwinSystem {
        modules =
          [
            inputs.nixvim.nixDarwinModules.nixvim
            home-manager.darwinModules.home-manager
            {home-manager.extraSpecialArgs = specialArgsMerged;}
          ]
          ++ modules;
        specialArgs = specialArgsMerged;
      };
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
    devShells = forEachSupportedSystem ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          alejandra
        ];
      };
    });
    nixosConfigurations = {
      dennou = mkNixosSystem {
        inherit system;
        modules = [
          ./hosts/dennou/configuration.nix
        ];
      };
      # nix build .#nixosConfigurations.kasou.config.system.build.isoImage
      nashi = mkDarwinSystem {
        # TODO
      };
      kasou = mkNixosSystem {
        inherit system;
        modules = [
          ./hosts/kasou/configuration.nix
          ({
            pkgs,
            modulesPath,
            ...
          }: {
            imports = [
              (
                modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix"
              )
            ];
          })
        ];
      };
    };
  };
}
