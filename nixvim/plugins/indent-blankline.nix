{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "│";
        tab_char = "│";
      };
      scope = {
        enabled = false;
      };
      exclude = {
        filetypes = [
          "help"
          "lspinfo"
          "checkhealth"
          "Trouble"
          "trouble"
          "TelescopePrompt"
          "TelescopeResults"
        ];
        buftypes = [
          "terminal"
          "nofile"
          "quickfix"
          "prompt"
        ];
      };
    };
  };
}
