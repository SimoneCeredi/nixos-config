{ config, lib, pkgs, ... }:

{
  # Import wayland config
  imports = 
  [
    ./wayland.nix
    ./pipewire.nix
    ./dbus.nix
  ];

  services.gnome.gnome-keyring.enable = true;

  programs.light.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
  };

  services.dbus.packages = with pkgs; [ dconf ];

}
