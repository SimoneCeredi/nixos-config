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

      keybindings = lib.mkOptionDefault {
        "${mod}+p" = "exec ${pkgs.dmenu-rs}/bin/dmenu-rs";
        "${mod}+x" = "exec sh -c '${pkgs.maim}/bin/maim -s | xclip -selection clipboard -t image/png'";
        "${mod}+Escape" = "exec sh -c '${pkgs.i3lock}/bin/i3lock -c 222222 & sleep 5 && xset dpms force of'";

        # Focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # Move
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # kill app
        "${mod}+q" = "kill";
      };
    };
  };
}
