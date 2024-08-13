{
  programs.nixvim = {
    opts.completeopt = ["menu" "menuone" "preview"];
    plugins = {
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;
      friendly-snippets.enable = true;
      luasnip = {
        enable = true;
        fromVscode = [{}];
      };
      cmp = {
        enable = true;
        settings = {
          snippet.expand = "
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        ";
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping.confirm({ select = true })";
            "<C-e>" = "cmp.mapping.close()";
          };
          sources = [
            {name = "path";}
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {
              name = "buffer";
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
          ];
          filetype = {
            sql.sources = [
              {name = "buffer";}
              {name = "vim-dadbod-completion";}
            ];
          };
        };
      };
    };
  };
}
