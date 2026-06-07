{ config, pkgs, lib, ... }:
{
  # ISO boot
  isoImage.isoName = "lucas-nixos.iso";
  isoImage.squashfsCompression = "zstd -Xcompression-level 6";
  boot.loader.grub.enable = lib.mkForce false;

  # Network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 443 80 ];
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

  # Autologin on live ISO
  services.displayManager.autoLogin = {
    enable = true;
    user = "lucas";
  };

  # VM guest tools
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # SSH
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
    extraGroups = [ "wheel" "networkmanager" "docker" "wireshark" ];
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  virtualisation.docker.enable = true;

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;

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
    nodejs
    unzip
    minicom
    tcpdump
    netcat-gnu
    docker-compose
    wireshark
    postman
    whois
    traceroute
    nasm
    lld
    remmina
    tor-browser
  ];

  system.stateVersion = "25.11";
}