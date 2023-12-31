{ config, lib, pkgs, ... }:

{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    neofetch 
    cava
    gnugrep gnused
    killall
    libnotify
    bat eza fd bottom ripgrep
    rsync
    tmux
    htop
    hwinfo
    unzip
    octave
    brightnessctl
    w3m
    fzf
    pandoc
    pciutils
    vim neovim
  ];
}
