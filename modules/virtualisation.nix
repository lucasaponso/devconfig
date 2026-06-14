{ config, pkgs, lib, ... }:
let
  hypervisor = "vmware";
in
{
  virtualisation.vmware.guest = lib.mkIf (hypervisor == "vmware") {
    enable = true;
    headless = false;
  };

  services.spice-vdagentd.enable = hypervisor == "qemu";
  services.qemuGuest.enable = hypervisor == "qemu";
}
