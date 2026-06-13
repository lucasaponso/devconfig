{ config, pkgs, lib, ... }:
{
  users.users.lucas = {
    isNormalUser = true;
    shell = pkgs.fish;
    initialPassword = "Yoplait4X$#";
    extraGroups = [ "wheel" "networkmanager" "docker" "wireshark" ];
  };
}
