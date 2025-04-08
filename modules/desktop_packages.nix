# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ lib, pkgs, config, inputs, ... }:
with lib;                      
let
  cfg = config.desktoppkgs;
in {
   options.desktoppkgs = {
    enable = mkEnableOption true;
    greeter = mkOption {
      type = types.str;
      default = "world";
    };
  };


config = mkIf cfg.enable {
  environment.systemPackages = with pkgs; [
  gnome-extension-manager
  firefox
  inputs.flake-zen.packages."x86_64-linux".default
  jetbrains.rust-rover
  jetbrains.idea-ultimate
  jetbrains.pycharm-community-bin
  vscode
  home-manager
  xclip
  ripgrep-all
  tailscale
  ghostty
  discord
  pika-backup
  opentofu
  terragrunt
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
 };

}
