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
          "<C-d>" = "<C-d>zz";
          "<C-u>" = "<C-u>zz";

          "<leader>rw" = "vim.cmd.Ex";

          "<leader>x" = "<cmd>!chmod +x %<CR>";
          "<leader>s" = "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]";
          "<leader>ee" = "oif err != nil {<CR>}<Esc>Oreturn err<Esc>";
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
