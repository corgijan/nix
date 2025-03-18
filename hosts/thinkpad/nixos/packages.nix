
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
  neovim
  gnome-extension-manager
  firefox
  fish
  oh-my-fish
  curl
  python3
  uv
  jetbrains.rust-rover
  jetbrains.idea-community-bin
  jetbrains.pycharm-community-bin
  vscode
  git
  home-manager
  xclip
  ripgrep-all
	
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
 ];

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = with pkgs;[
    flatpak 
    ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
      flatpak install flathub app.zen_browser.zen -y
      for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']" ; done
      for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Super><Shift>$i']" ; done
    '';
  };
  
 services.xserver.excludePackages = with pkgs; [
 	xterm
 ];
environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-music nixos-render-docs pantheon.epiphany yelp gnome-clocks geary gnome-contacts];
}


