{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  let
    # ---- SYSTEM SETTINGS ---- #
    system = "x86_64-linux"; # system arch
    hostname = "nixos-vm"; # hostname
    profile = "uni"; # select a profile defined from my profiles directory
    timezone = "Europe/Rome"; # select timezone
    locale = "en_US.UTF-8"; # select locale

    # ----- USER SETTINGS ----- #
    username = "simone"; # username
    name = "SimoneCeredi"; # name/identifier
    email = "ceredi.simone.iti@gmail.com"; # email (used for certain configurations)
    wm = "i3"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
    wmType = "x11"; # x11 or wayland

    # configure pkgs
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    # configure lib
    lib = nixpkgs.lib;
  in {
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ (./. + "/profiles"+("/"+profile)+"/home.nix") ]; # load home.nix from selected PROFILE
          extraSpecialArgs = {
            # pass config variables from above
            inherit username;
            inherit name;
            inherit hostname;
            inherit profile;
            inherit email;
            inherit wm;
            inherit wmType;
          };

        };
      };
      nixosConfigurations = {
      system = lib.nixosSystem {
        inherit system;
        modules = [ (./. + "/profiles"+("/"+profile)+"/configuration.nix") ]; # load configuration.nix from selected PROFILE
        specialArgs = {
          # pass config variables from above
          inherit username;
          inherit name;
          inherit hostname;
          inherit timezone;
          inherit locale;
          inherit wm;
        };
      };
    };
  };
}
