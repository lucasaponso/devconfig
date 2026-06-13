{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  environment.systemPackages = with pkgs; [
    # Core utils
    git
    gnumake
    curl
    wget
    unzip
    bc
    perl

    # Editors
    neovim
    vscode
    zed-editor

    # Shell tools
    fzf
    ripgrep
    htop
    tmux

    # Compilers / build
    gcc
    cmake
    flex
    bison
    openssl
    elfutils
    nasm
    lld
    protobuf

    # Languages / runtimes
    python3
    nodejs
    jdk25

    # Networking
    nmap
    tcpdump
    netcat-gnu
    whois
    traceroute
    minicom
    openfortivpn

    # Containers
    docker-compose

    # GUI apps
    firefox
    wireshark
    postman
    remmina
    tor-browser
    slack

    # JetBrains
    jetbrains.datagrip
  ];
}
