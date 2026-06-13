{ config, pkgs, lib, ... }:
{
  users.users.lucas = {
    isNormalUser = true;
    shell = pkgs.fish;
    initialPassword = "Yoplait4X$#";
    extraGroups = [ "wheel" "networkmanager" "docker" "wireshark" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3Nz... your-public-key-here"
    ];
  };
}
