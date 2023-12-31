{ config, lib, pkgs, ...}:
let
  modifier = "Mod4";
  launcher = "${pkgs.dmenu-rs}/bin/dmenu_run";
  light = "${pkgs.light}/bin/light";
  pamixer = "${pkgs.pamixer}/bin/pamixer";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  i3lockcmd = "${pkgs.i3lock}/bin/i3lock -c '#000000'";

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
      bars = [{
        fonts = {
          names = [ "JetBrains Mono" ];
          size = 9.0;
        };
        statusCommand = "i3status-rs $HOME/.config/i3status-rust/config-top.toml";
        extraConfig = "height 16";
      }];

      keybindings = {
            "XF86MonBrightnessUp" = "exec ${light} -A 5 && ${light} -G | cut -d'.' -f1 > $SWAYSOCK.wob";
            "XF86MonBrightnessDown" = "exec ${light} -U 5 && ${light} -G | cut -d'.' -f1 > $SWAYSOCK.wob";
            "XF86AudioRaiseVolume" = "exec ${pamixer} -ui 2 && ${pamixer} --get-volume > $SWAYSOCK.wob";
            "XF86AudioLowerVolume" = "exec ${pamixer} -ud 2 && ${pamixer} --get-volume > $SWAYSOCK.wob";
            "XF86AudioMute" = "exec ${pamixer} --toggle-mute && ( ${pamixer} --get-mute && echo 0 > $SWAYSOCK.wob ) || ${pamixer} --get-volume > $SWAYSOCK.wob";

            "ctrl+shift+c" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.wl-clipboard}/bin/wl-copy -t image/png";

            "${modifier}+Return" = "exec ${terminal}";
            "${modifier}+Escape" = "exec ${i3lockcmd}";
            "${modifier}+q" = "kill";
            "${modifier}+Shift+r" = "reload";
            "${modifier}+t" = "layout toggle tabbed split";

            "${modifier}+h" = "focus left";
            "${modifier}+j" = "focus down";
            "${modifier}+k" = "focus up";
            "${modifier}+l" = "focus right";

            "${modifier}+Shift+h" = "move left";
            "${modifier}+Shift+j" = "move down";
            "${modifier}+Shift+k" = "move up";
            "${modifier}+Shift+l" = "move right";

            "${modifier}+1" = "workspace number 1";
            "${modifier}+2" = "workspace number 2";
            "${modifier}+3" = "workspace number 3";
            "${modifier}+4" = "workspace number 4";
            "${modifier}+5" = "workspace number 5";
            "${modifier}+6" = "workspace number 6";
            "${modifier}+7" = "workspace number 7";
            "${modifier}+8" = "workspace number 8";
            "${modifier}+9" = "workspace number 9";
            "${modifier}+0" = "workspace number 10";

            "${modifier}+b" = "splith";
            "${modifier}+v" = "splitv";
            "${modifier}+f" = "fullscreen toggle";
            "${modifier}+Shift+space" = "floating toggle";
            "${modifier}+w" = "sticky toggle";
            "${modifier}+a" = "focus parent";
            "${modifier}+d" = "exec ${launcher}";

            "${modifier}+Shift+1" = "move container to workspace number 1";
            "${modifier}+Shift+2" = "move container to workspace number 2";
            "${modifier}+Shift+3" = "move container to workspace number 3";
            "${modifier}+Shift+4" = "move container to workspace number 4";
            "${modifier}+Shift+5" = "move container to workspace number 5";
            "${modifier}+Shift+6" = "move container to workspace number 6";
            "${modifier}+Shift+7" = "move container to workspace number 7";
            "${modifier}+Shift+8" = "move container to workspace number 8";
            "${modifier}+Shift+9" = "move container to workspace number 9";
            "${modifier}+Shift+0" = "move container to workspace number 10";
          };
    };
  };
}
