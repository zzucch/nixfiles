{abs, ...}: {
  imports = let
    moduleNames = builtins.attrNames (builtins.readDir ./modules);
    modulePaths = map (name: ./modules + "/${name}") moduleNames;
  in
    [
      ./gui-pkgs.nix
      (abs "nixvim/init.nix")
      (abs "users/zcchr/nixos.nix")
    ]
    ++ modulePaths;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.substituters = ["https://aseipp-nix-cache.freetls.fastly.net"];
  system.stateVersion = "24.05";
}
