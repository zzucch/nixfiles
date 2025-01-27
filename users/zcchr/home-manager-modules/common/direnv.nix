{
  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      silent = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
