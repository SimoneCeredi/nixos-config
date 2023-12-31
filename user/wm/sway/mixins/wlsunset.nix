{ pkgs, ... }:

{
  config = {
    services.wlsunset = {
      enable = true;
      latitude = "44.258330";
      longitude = "12.353149";
      temperature.day = 6500;
      temperature.night = 4500;
    };
  };
}
