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
    extraConfigLua = ''
      local groups = {
            "Normal",
            "NormalNC",
            "CursorLine",
            "CursorLineNC",
      }

      for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    '';
  };
}
