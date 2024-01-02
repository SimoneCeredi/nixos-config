{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.pycharm-professional
  ];
}
