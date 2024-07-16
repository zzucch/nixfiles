{
  imports = let
    pluginNames = builtins.attrNames (builtins.readDir ./plugins);
    pluginPaths = map (name: ./plugins + "/${name}") pluginNames;
  in
    [
      ./options.nix
      ./keymaps.nix
    ]
    ++ pluginPaths;
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        disable_background = true;
      };
    };
  };
}
