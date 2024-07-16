{abs, ...}: {
  home.file.".ssh/git.pub".source = abs "ssh/zcchr-git.pub";
  home.file.".ssh/git-sign.pub".source = abs "ssh/zcchr-git-sign.pub";
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/git.pub";
      };
    };
  };
}
