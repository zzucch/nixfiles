{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs; [
      vimPlugins.vim-dadbod
      vimPlugins.vim-dadbod-ui
      vimPlugins.vim-dadbod-completion
    ];
  };
}
