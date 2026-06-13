{ config, pkgs, lib, ... }:
{
  programs.direnv.enable = true;
  programs.fish.enable = true;

  programs.git = {
    enable = true;
    config = {
      user.name = "Lucas Aponso";
      user.email = "lucasaponso@outlook.com";
    };
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  virtualisation.docker.enable = true;
}
