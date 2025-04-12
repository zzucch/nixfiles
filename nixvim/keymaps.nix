{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "n" = "nzz";
          "N" = "Nzz";
          "J" = "miJ`i";
          "<C-d>" = "<C-d>zz";
          "<C-u>" = "<C-u>zz";
          "<leader>x" = "<cmd>!chmod +x %<CR>";
          "<leader>ee" = "oif err != nil {<CR>}<Esc>Oreturn err<Esc>";
          "<leader>yy" = "miggO```<Esc>Go```<Esc>ggVGygg\"_ddG\"_dd`i";
          "<C-t>" = "<cmd>silent !tmux neww tmux-sessionizer<CR>";
        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
          "<leader>p" = "\"_dP";
          "<leader>d" = "\"_dd";
          "<leader>yy" = "miVo```<Esc>gvoVO```<Esc>gvkojy\"_ddgvV\"_dd`i";
        };
      nv =
        lib.mapAttrsToList
        (key: action: {
          mode = ["i" "n"];
          inherit action key;
        })
        {
          "<Up>" = "<Nop>";
          "<Down>" = "<Nop>";
          "<Left>" = "<Nop>";
          "<Right>" = "<Nop>";
        };
    in
      config.lib.nixvim.keymaps.mkKeymaps
      {options.silent = true;}
      (normal ++ visual ++ nv);
  };
}
