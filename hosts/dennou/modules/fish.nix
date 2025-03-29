{
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
      gd = "git diff --color | less";
      gds = "git diff --staged --color | less";
      gdss = "git diff --staged --stat --color | less";
      gsc = "git switch -c";
      gsm = "git switch master";
      grs = "git restore --staged .";

      gbl = "git blame -w";
      gb = "git bisect start";
      # NOTE: havent tested the thing in bash; for zsh, use \`
      # NOTE: it might fail when there are multiple root commits
      gbs = "git bisect start && git bisect bad && git bisect good (git rev-list --max-parents=0 --first-parent HEAD)";
      gbb = "git bisect bad";
      gbg = "git bisect good";
      gbn = "git bisect new";
      gbo = "git bisect old";
      gbr = "git bisect reset";

      gg = "go get";
      gmt = "go mod tidy";
      gt = "go test ./...";
      gtc = "go test -count=1 ./...";
    };
    shellInit = ''
      set fish_greeting
      fish_vi_key_bindings

      function fish_mode_prompt
        switch $fish_bind_mode
          case default
            echo ""
          case insert
            echo ""
          case visual
            echo ""
          case replace
            echo ""
          case replace_one
            echo ""
        end
      end

      bind -M insert \t accept-autosuggestion
    '';
    # ^ lowkey hate the completions but too lazy to fix
  };
}
