{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          email = "nikitamilovatskiy@gmail.com";
          name = "zzucch";
        };
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/git-sign.pub";
        push.autoSetupRemote = "true";
      };
    };
  };
}
