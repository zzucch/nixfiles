{pkgs, ...}: {
  imports = [./nixos-common.nix];
  programs.fish = {
    enable = true;
    shellAbbrs = {
      t = "tmux";
      ta = "tmux a";

      n = "nvim .";

      ga = "git add -A";
      gc = "git commit -m";
      gca = "git commit --amend";
      gp = "git push";
      gs = "git status";
      gd = "git diff";
      gds = "git diff --staged";
      gdss = "git diff --staged --stat";
      gsc = "git switch -c";
      gsm = "git switch master";

      gg = "go get";
      gmt = "go mod tidy";
      gt = "go test ./...";
      gtc = "go test -count=1 ./...";
    };
    shellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      bind -M insert \t accept-autosuggestion
    '';
  };
  environment.systemPackages = with pkgs; [
    home-manager

    tree
    fzf
    scc
    glow
    tldr
    lazygit
    neofetch
    fastfetch

    btop
    htop

    zip
    unzip

    ffmpeg
    killall
    ripgrep
    brightnessctl
  ];
}
