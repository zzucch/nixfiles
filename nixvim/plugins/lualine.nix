{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        icons_enabled = true;
        globalstatus = true;
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          "branch"
          "diff"
        ];
        lualine_c = [
          "diagnostics"
          "filename"
        ];
        lualine_x = [""];
        lualine_y = ["location"];
        lualine_z = [""];
      };
      inactive_sections = {
        lualine_x = [""];
        lualine_z = [""];
      };
    };
  };
}
