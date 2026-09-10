# Adds Sway as a second, selectable session alongside GNOME.
# GDM already lists both sessions in its gear menu at login, so
# GNOME stays the daily driver while Sway is available for testing.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard # Copy/Paste functionality.
    mako # Notification utility.
  ];

  # Enables Gnome Keyring to store secrets for applications.
  services.gnome.gnome-keyring.enable = true;

  # Enable Sway.
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
