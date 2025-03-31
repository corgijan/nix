
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
  neovim
  gnome-extension-manager
  firefox
  fish
  pkgs.fishPlugins.z
  keepassxc
  oh-my-fish
  trash-cli
  curl
  gcc
  zig
  inputs.flake-zen.packages."x86_64-linux".default
  python3
  uv
  jetbrains.rust-rover
  jetbrains.idea-ultimate
  jetbrains.pycharm-community-bin
  vscode
  git
  home-manager
  xclip
  ripgrep-all
  tailscale
	
  #k8s 
  docker
  distrobox
  docker-compose
  #podman
  #podman-compose
  kubectl
  k9s
  kubectx

  pika-backup
  spotify
  telegram-desktop
  signal-desktop
  discord
  ghostty
 ];

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = with pkgs;[
    flatpak 
    ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
    '';
  };
  
 services.xserver.excludePackages = with pkgs; [
 	xterm
 ];
environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-music nixos-render-docs pantheon.epiphany yelp gnome-clocks geary gnome-contacts gnome-console];
}


