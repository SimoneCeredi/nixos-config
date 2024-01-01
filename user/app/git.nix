{ config, lib, pkgs, name, email, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    extraConfig = {
      init.defaultBranch = "master";
    };
  };
}
