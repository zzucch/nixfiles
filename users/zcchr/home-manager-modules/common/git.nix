{
  programs.git = {
    enable = true;
    userName = "zzucch";
    userEmail = "nikitamilovatskiy@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/git-sign.pub";
      push.autoSetupRemote = "true";
    };
  };
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
