# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ lib, pkgs, config, inputs, ... }:
with lib;                      
let
  cfg = config.basepkgs;
in {
   options.basepkgs = {
    enable = mkEnableOption true;
    greeter = mkOption {
      type = types.str;
      default = "world";
    };
    tryk = mkEnableOption true;
  };

config = mkIf cfg.enable {
  environment.systemPackages = with pkgs; [
  neovim
  fish
  pkgs.fishPlugins.z
  trash-cli
  curl
  python3
  git
 ];
};
}
