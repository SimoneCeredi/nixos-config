{
  systemd.user.services.kanshi = {
    serviceConfig = {
      StartLimitBurst = 5;
      StartLimitIntervalSec = 30;
    };
  };
  services.kanshi = {
    enable = true;
    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "2880x1800";
            position = "0,0";
          }
        ];
      };
      docked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "2880x1800";
            position = "0,0";
          }
          {
            criteria = "HDMI1";
            mode = "3840x2160";
            position = "2880,0";
          }
        ];
      };
    };
  };
}
