{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      t = "tmux";
      ta = "tmux a";
      ts = "tmux-sessionizer";

      n = "nvim .";

      ga = "git add -A";
      gc = "git commit -m";
      meow = "git commit -m \"meow\"";
      gca = "git commit --amend";
      gp = "git push";
      gpf = "git push --force";
      gu = "git pull";
      gs = "git status";
      gd = "git diff --color | less";
      gds = "git diff --staged --color | less";
      gdss = "git diff --staged --stat --color | less";
      gdms = "git diff master --staged --stat --color | less";
      gsc = "git switch -c";
      gsm = "git switch master || git switch main";
      grs = "git restore --staged .";

      gbl = "git blame -w";
      gb = "git bisect start";
      # NOTE: havent tested the thing in bash; for zsh, use \`
      # NOTE: it might fail when there are multiple root commits
      gbew = "git bisect start && git bisect bad && git bisect good (git rev-list --max-parents=0 --first-parent HEAD)";
      gbb = "git bisect bad";
      gbg = "git bisect good";
      gbn = "git bisect new";
      gbo = "git bisect old";
      gbend = "git bisect reset";

      gg = "go get";
      gmt = "go mod tidy";
      gt = "go test ./...";
      gtc = "go test -count=1 ./...";

      dsa = "sudo docker stop \$(sudo docker ps -a -q)";
      dra = "sudo docker rm \$(sudo docker ps -a -q)";

      mg = "make generate";
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

      function fish_user_key_bindings
        for mode in insert default
          bind -M $mode \cf accept-autosuggestion
        end
      end
    '';
  };
}
