{ config, pkgs, lib, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 443 80 3000 ];
  networking.firewall.enable = true;

  services.resolved.enable = true;
}
