{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            leftcontrol = "leftalt";
            leftalt = "leftcontrol";
            rightcontrol = "rightalt";
            rightalt = "rightcontrol";
          };
        };
      };
    };
  };
}
