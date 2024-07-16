{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = ["markdown"];
      };
      indent.enable = true;
    };
    folding = false;
  };
  programs.nixvim.plugins.hmts.enable = true;
}
