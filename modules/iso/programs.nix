{ config, pkgs, lib, ... }:
{
  programs.fish.enable = true;
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}
