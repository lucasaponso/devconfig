{ config, pkgs, lib, ... }:
{
  isoImage.isoName = "lucas-nixos.iso";
  isoImage.squashfsCompression = "zstd -Xcompression-level 6";
  boot.loader.grub.enable = lib.mkForce false;
}
