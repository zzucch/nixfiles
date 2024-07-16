{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>pf" = "find_files";
      "<C-p>" = "git_files";
      "<C-f>" = "live_grep";
    };
    settings.defaults = {
      set_env.COLORTERM = "truecolor";
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
    };
  };
}
