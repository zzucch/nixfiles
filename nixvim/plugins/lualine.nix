{
  programs.nixvim.plugins.lualine = {
    enable = true;
    iconsEnabled = true;
    globalstatus = true;
    theme = "auto";
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
    inactiveSections = {
      lualine_x = [""];
      lualine_z = [""];
    };
  };
}
