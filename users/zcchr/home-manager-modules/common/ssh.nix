{abs, ...}: {
  home.file.".ssh/git.pub".source = abs "ssh/zcchr-git.pub";
  home.file.".ssh/git-sign.pub".source = abs "ssh/zcchr-git-sign.pub";
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        identityFile = "~/.ssh/git-sign";
      };
      "github.com" = {
        identityFile = "~/.ssh/git";
      };
      "kasou" = {
        hostname = "10.244.82.78";
      };
      "meiro" = {
        hostname = "10.244.200.78";
      };
    };
  };
}
