{ config, pkgs, lib, ... }:
{
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  virtualisation.docker.enable = true;
}
