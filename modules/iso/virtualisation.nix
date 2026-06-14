{ config, pkgs, lib, hypervisor ? "qemu", ... }:
{
  services.spice-vdagentd.enable = hypervisor == "qemu";
  services.qemuGuest.enable = hypervisor == "qemu";
  virtualisation.vmware.guest = lib.mkIf (hypervisor == "vmware") {
    enable = true;
    headless = false;
  };
  virtualisation.docker.enable = true;
}
