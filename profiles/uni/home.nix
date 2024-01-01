{ config, lib, pkgs, username, name, hostname, profile, email, wm, wmType, ...}:
{
  home.username = username;
  home.homeDirectory = "/home/" + username;
  
  programs.home-manager.enable = true;

  imports = 
  [
    ../../user/hardware/bluetooth.nix # Bluetooth
    ../../user/shell/sh.nix # My zsh and bash config
    ../../user/shell/cli-collection.nix # Useful CLI apps
    ../../user/app
    (./. + "../../../user/wm"+("/"+wm+"/"+wm)+".nix") # My window manager selected from flake
    
  ];

  home.packages = with pkgs; [
    neovim
    vim
    kitty
    alacritty
    firefox
    zsh
    gnome.nautilus
  ];

  services.syncthing.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Media/Music";
    videos = "${config.home.homeDirectory}/Media/Videos";
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
      XDG_VM_DIR = "${config.home.homeDirectory}/Machines";
      XDG_ORG_DIR = "${config.home.homeDirectory}/Org";
      XDG_PODCAST_DIR = "${config.home.homeDirectory}/Media/Podcasts";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SPAWNEDITOR = "exec kitty -e nvim";
    TERM = "kitty";
    BROWSER = "firefox";
  };

  home.stateVersion = "23.11";
}
