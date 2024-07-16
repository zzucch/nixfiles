{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        columns = ["icon"];
        view_options.show_hidden = true;
        deleteToTrash = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = ":Oil<CR>";
        options = {
          desc = "Open parent directory";
          silent = true;
        };
      }
    ];
  };
}
