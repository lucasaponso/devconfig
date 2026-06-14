{ config, pkgs, lib, hypervisor ? "qemu", ... }:
{
  services.spice-vdagentd.enable = hypervisor == "qemu";
  services.qemuGuest.enable = hypervisor == "qemu";

  virtualisation.vmware.guest.enable = hypervisor == "vmware";

  virtualisation.docker.enable = true;
}