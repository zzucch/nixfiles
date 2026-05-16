{
  pkgs,
  pkgs-latest,
  config,
  ...
}: {
  home.packages = with pkgs; [
    pkgs-latest.neovim
    pkgs-latest.claude-code
    git
    tree-sitter

    nil
    lua-language-server
    bash-language-server
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    gopls
    ccls
    cmake-language-server
    dockerfile-language-server
    rust-analyzer
    marksman
    yaml-language-server

    alejandra
    stylua
    shfmt
    shellcheck
    shellharden
    gofumpt
    golines
    gotools
    clang-tools
    prettierd
    nodePackages.prettier
    pgformatter
    jq
    yamlfmt
    buf

    gomodifytags
    impl
    hadolint
    delve

    golangci-lint
    checkmake
    nodePackages.markdownlint-cli
    actionlint
    yamllint
    protolint
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/nvim";
}
