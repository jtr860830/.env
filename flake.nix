{
  description = "nix-darwin + NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ... }@inputs:
  let
    hmConfig = {
      useGlobalPkgs   = true;
      useUserPackages = true;
      users.jtr860830 = import ./home;
    };

    mkDarwin = hostname: nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs hostname; };
      modules = [
        ./darwin
        home-manager.darwinModules.home-manager
        { home-manager = hmConfig; }
      ];
    };

    mkNixos = hostname: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs hostname; };
      modules = [
        ./linux
        home-manager.nixosModules.home-manager
        { home-manager = hmConfig; }
      ];
    };
  in {
    darwinConfigurations = {
      "pro-darwin" = mkDarwin "pro-darwin";
    };

    nixosConfigurations = {
      # "linux-main" = mkNixos "linux-main";
    };
  };
}
