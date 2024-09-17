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
          nil-ls = {
            enable = true;
            settings = {
              formatting.command = ["alejandra"];
            };
          };
          lua-ls.enable = true;
          bashls.enable = true;
          html.enable = true;
          eslint.enable = true;
          ts-ls.enable = true;
          ccls.enable = true;
          cmake.enable = true;
          gopls.enable = true;
          gleam.enable = true;
          dockerls.enable = true;
          docker-compose-language-service.enable = true;
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
            settings = {
              cargo.features = "all";
            };
          };
          hls.enable = true;
          marksman.enable = true;
          yamlls.enable = true;
          dhall-lsp-server.enable = true;
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          notify_on_error = true;
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
            haskell = ["ormolu"];
            css = ["stylelint"];
            javascript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              timeout_ms = 2000;
              stop_after_first = true;
            };
            sql = ["sqlfluff"];
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
      ormolu
      shfmt
      shellcheck
      shellharden
      sqlfluff
      stylelint
      prettierd
      jq
      yamllint
      yamlfmt
    ];
  };
}
