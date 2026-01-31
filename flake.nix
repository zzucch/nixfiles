{
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
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
  };
  outputs = {
    self,
    nixpkgs,
    nixvim,
    nixpkgs-stable,
    home-manager,
    zapret-discord-youtube,
    proxmox-nixos,
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
      haizara = mkNixosSystem {
        inherit system;
        modules = [
          ./hosts/haizara/configuration.nix
          zapret-discord-youtube.nixosModules.default
          {
            services.zapret-discord-youtube = {
              enable = true;
              config = "general(ALT)";
            };
          }
        ];
      };
      zatsumu = mkNixosSystem {
        inherit system;
        modules = [
          ./hosts/zatsumu/configuration.nix
          zapret-discord-youtube.nixosModules.default
          {
            services.zapret-discord-youtube = {
              enable = true;
              config = "general(ALT)";
            };
          }
        ];
      };
      kasou = mkNixosSystem {
        inherit system;
        modules = [
          ./hosts/kasou/configuration.nix
          proxmox-nixos.nixosModules.proxmox-ve
          ({
            pkgs,
            lib,
            ...
          }: {
            services.proxmox-ve = {
              enable = true;
              ipAddress = "192.168.0.34";
            };
            nixpkgs.overlays = [
              proxmox-nixos.overlays.${system}
            ];
          })
        ];
      };
    };
  };
}
