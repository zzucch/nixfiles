{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    opts = {
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;
      breakindent = true;

      wrap = false;

      ignorecase = true;
      smartcase = true;
      hlsearch = false;
      incsearch = true;
      showmatch = true;

      # TODO: fugure out why do i even had this enabled in the first place
      # gdefault = true;

      number = true;
      relativenumber = true;
      cursorline = false;
      guicursor = "";

      confirm = true; # Confirm to save changes before exiting modified buffer
      termguicolors = true;
      pumblend = 10;

      scrolloff = 8;
      signcolumn = "yes";
      colorcolumn = "80";

      undofile = true;
      swapfile = false;

      fillchars = {
        eob = " ";
      };

      wildmode = "longest:full,full";
    };
    globals = {
      netrw_browse_split = 0;
      netrw_banner = 0;
      markdown_recommended_style = 0;
    };
    # TODO: figure out how to do this without lua, if possible
    extraConfigLua = ''
      vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    '';
  };
}
