{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;  # useful for networking work
      "fs.inotify.max_user_watches" = 524288;
      "net.ipv4.tcp_syncookies" = 1;
      "vm.vfs_cache_pressure" = 50;  # default 100, lower = keep more in cache
      "kernel.kptr_restrict" = 2;
      "kernel.dmesg_restrict" = 1;
  };

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

  services.resolved.enable = true;

  programs.direnv.enable = true;

  # CUPS printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip             # HP printers
    ];
  };

  # Network printer discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # User
  users.users.lucas = {
    isNormalUser = true;
    shell = pkgs.fish;
    initialPassword = "Yoplait4X$#";
    extraGroups = [ "wheel" "networkmanager" "docker" "wireshark" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3Nz... your-public-key-here"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code
];

  programs.git = {
    enable = true;
    config = {
      user.name = "Lucas Aponso";
      user.email = "lucasaponso@outlook.com";
    };
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
    zed-editor
  ];

  system.stateVersion = "25.11";
}
