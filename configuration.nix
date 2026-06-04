{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot
  # Replace with:
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";  # or /dev/vda for QEMU — check with lsblk
  };

  # Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.enable = true;
  
  # Locale
  time.timeZone = "Australia/Melbourne";
  i18n.defaultLocale = "en_AU.UTF-8";

  # Desktop
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    displayManager.lightdm.enable = true;
  };

  # VM guest tools (QEMU/KVM)
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  # User
  users.users.lucas = {
    isNormalUser = true;
    shell = pkgs.fish;
    initialPassword = "Yoplait4X$#";
  };
  
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  virtualisation.docker.enable = true;

  users.users.lucas.extraGroups = [
    "wheel"
    "networkmanager"
    "docker"
    "wireshark"
  ];

  systemd.tmpfiles.rules = [
    "d /etc/nixos 0755 lucas users"
  ];

  # Shell
  programs.fish.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    git
    vscode
    curl
    wget
    neovim
    fzf
    ripgrep
    htop
    nmap
    firefox
    tmux
    gcc
    cmake
    python3
    docker
    nodejs
    unzip
    minicom
    tcpdump
    netcat
    docker-compose
    wireshark
    postman
    whois
    traceroute
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
