{ config, lib, pkgs, ... }:

{
  # Import wayland config
  imports = [ ./wayland.nix
              ./pipewire.nix
              ./dbus.nix
            ];
}
