{
  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
