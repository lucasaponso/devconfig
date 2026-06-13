{ config, pkgs, lib, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "fs.inotify.max_user_watches" = 524288;
    "net.ipv4.tcp_syncookies" = 1;
    "vm.vfs_cache_pressure" = 50;
    "kernel.kptr_restrict" = 2;
    "kernel.dmesg_restrict" = 1;
  };

  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";
  boot.kernelParams = [ "Plymouth.debug" ];
}
