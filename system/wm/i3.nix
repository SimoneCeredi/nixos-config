{
  imports = 
  [
    ./x11.nix
  ];
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = true;

    displayManager.defaultSession = "none+i3";

    windowManager.i3.enable = true;
  };
}
