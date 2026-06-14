{ config, pkgs, lib, hypervisor ? "qemu", ... }:
{
  imports = [
    ./modules/iso/boot.nix
    ./modules/iso/locale.nix
    ./modules/iso/networking.nix
    ./modules/iso/desktop.nix
    ./modules/iso/virtualisation.nix
    ./modules/iso/audio.nix
    ./modules/iso/users.nix
    ./modules/iso/programs.nix
    ./modules/iso/nix.nix
    ./modules/iso/packages.nix
    ./modules/iso/system.nix
  ];
}
