{ config, lib, pkgs, ...}:
let
  mod = "Mod4";
in {
  imports = [
    ../mixins/cursor.nix
    ../mixins/i3status.nix
  ];

  home.packages = with pkgs; [
    dmenu-rs
    i3lock
    i3blocks
    arandr
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      bars = [{
        fonts = {
          names = [ "JetBrains Mono" ];
          size = 9.0;
        };
      statusCommand = "i3status-rs $HOME/.config/i3status-rust/config-top.toml";
      extraConfig = "height 16";
    }];
    };
  };
}
