{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };
          lspBuf = {
            "<leader>f" = "format";
            K = "hover";
            gd = "definition";
            gD = "declaration";
            gI = "implementation";
            "<leader>vca" = "code_action";
            "<leader>vrf" = "references";
            "<leader>vrn" = "rename";
            gt = "type_definition";
            gi = "implementation";
          };
        };
        servers = {
          nil_ls = {
            enable = true;
            settings = {
              formatting.command = ["alejandra"];
            };
          };
          lua_ls.enable = true;
          bashls.enable = true;
          html.enable = true;
          cssls.enable = true;
          eslint.enable = true;
          ts_ls.enable = true;
          ccls.enable = true;
          cmake.enable = true;
          gopls.enable = true;
          gleam.enable = true;
          dockerls.enable = true;
          docker_compose_language_service.enable = true;
          # disabled for at least until
          # https://github.com/sqls-server/sqls/issues/149 is closed
          sqls.enable = false;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
            settings = {
              cargo.features = "all";
            };
          };
          protols.enable = true;
          hls.enable = true;
          marksman.enable = true;
          yamlls.enable = true;
          dhall_lsp_server.enable = true;
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          notify_on_error = true;
          format_on_save = {
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            bash = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            sh = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            c = ["clang-format"];
            nix = ["alejandra"];
            lua = ["stylua"];
            # https://github.com/stevearc/conform.nvim/issues/387
            go = ["gofumpt" "golines"];
            proto = ["buf"];
            haskell = ["ormolu"];
            javascript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              timeout_ms = 2000;
              stop_after_first = true;
            };
            sql = ["pg_format"];
            json = ["jq"];
            markdown = ["prettierd"];
            yaml = [
              "yamllint"
              "yamlfmt"
            ];
          };
        };
      };
    };
    extraPackages = with pkgs; [
      alejandra
      clang-tools
      golines
      gofumpt
      stylua
      buf
      ormolu
      shfmt
      shellcheck
      shellharden
      sqlfluff
      stylelint
      pgformatter
      prettierd
      jq
      yamllint
      yamlfmt
    ];
  };
}
