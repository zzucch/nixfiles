{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding.enable = false;
      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = ["markdown"];
        };
        indent.enable = true;
      };
    };
    hmts.enable = true;
  };
}
