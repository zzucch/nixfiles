{pkgs, ...}: {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  users.users.zcchr.extraGroups = ["wireshark"];
}
