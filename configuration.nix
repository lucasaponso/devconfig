{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/virtualisation.nix
    ./modules/audio.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/programs.nix
    ./modules/nix.nix
    ./modules/packages.nix
  ];

  time.timeZone = "Australia/Melbourne";
  i18n.defaultLocale = "en_AU.UTF-8";

  system.stateVersion = "25.11";
}
