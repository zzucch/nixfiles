{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
      settings = {
        modes = {
          preview_split = {
            mode = "diagnostics";
            preview = {
              type = "split";
              relative = "win";
              position = "down";
              size = 0.5;
            };
          };
        };
      };
    };
    keymaps = lib.mkIf config.programs.nixvim.plugins.trouble.enable [
      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options = {
          silent = true;
        };
      }
    ];
  };
}
