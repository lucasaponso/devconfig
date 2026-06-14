{ config, pkgs, lib, hypervisor ? "qemu", ... }:
{
  isoImage.isoName = "lucas-nixos-${hypervisor}.iso";
  isoImage.squashfsCompression = "zstd -Xcompression-level 6";
  boot.loader.grub.enable = lib.mkForce false;
}
