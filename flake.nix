{
    description = "A flake for my NixOS configuration";
    
    # Define external dependencies
    inputs = {
        # Use the unstable branch of nixpkgs as our package source
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        # Home Manager for managing user environment
        home-manager = {
            url = "github:nix-community/home-manager";
            # Use the same nixpkgs instance as defined above
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # hyprpanel the bar of hyprland
        hyprpanel = {
            url = "github:Jas-SinghFSU/HyprPanel";
            inputs.nixpkgs.follows = "nixpkgs";
        };


        # nur
        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix.url = "github:danth/stylix";
    };

    # Define what this flake produces
    outputs = { self, nixpkgs, home-manager, hyprpanel, nur, stylix }: let
        system = "x86_64-linux";
        
        # Configure pkgs with overlay
        pkgs = import nixpkgs {
            inherit system;
            overlays = [
                hyprpanel.overlay
                nur.overlays.default
            ];
            config = {
                allowUnfree = true;
            };
        };
        
    in {
        # Define NixOS system configurations
        nixosConfigurations = {
            # Configuration named "nixos"
            nixos-Laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                # List of modules to include in the configuration
                modules = [ 
                    # Override the default pkgs with mkForce
                    { _module.args.pkgs = nixpkgs.lib.mkForce pkgs; }
                    
                    # Import system configuration from ./nixos directory
                    ./nixos-Laptop
                ];
            };
            nixos-Desktop = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    { _module.args.pkgs = nixpkgs.lib.mkForce pkgs; }
                    ./nixos-Desktop
                ];
            };
        };

        homeConfigurations = {
            "elokelears" = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home

                    stylix.homeManagerModules.stylix

                    hyprpanel.homeManagerModules.hyprpanel 

                    
                ];
            };
        };
    };
}