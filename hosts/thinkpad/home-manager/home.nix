# This is your home-manager configuration file
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
  ];

   home.sessionVariables = {
   	EDITOR = "nvim";
   };

   home.file = { 
   ".config/fish/config.fish" = { text = (builtins.readFile ../../../configs/fish/config.fish); executable = false; };
   ".config/ghostty/config" = { text = (builtins.readFile ../../../configs/ghostty/config); executable = false; };
    # Nvim
   ".config/nvim/init.lua" = { text = (builtins.readFile ../../../configs/nvim/init.lua); executable = false; };
   ".config/nvim" = { 
    source = ../../../configs/nvim-complete/nvim;
    recursive = true;
   };
   };

   dconf.settings = {
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
        picture-uri = "file:///home/jan/nix/images/yosemite.jpg";
        picture-uri-dark = "file:///home/jan/nix/images/yosemite.jpg";
      };

 	"org/gnome/desktop/wm/preferences" = {
      		button-layout = "close:";
    	};
	
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # `gnome-extensions list` for a list
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
	      "fullscreen-to-empty-workspace2@corgijan.dev"
	      "caffeine@patapon.info"
	      "blur-my-shell@aunetx"
	      "clipboard-history@alexsaveau.dev"
      ];
    };

    "org/gnome/shell" = {
      favorite-apps = [
	      "app.zen_browser.zen.desktop"
        "org.gnome.Nautilus.desktop"
	      "com.mitchellh.ghostty.desktop"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      enable-animations = false; 
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
    };

      gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };


    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "jan";
    homeDirectory = "/home/jan";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
    programs.git = {
    enable = true;
    userName = "corgijan";
    userEmail = "jan.vaorin@tu-dortmund.de";
    aliases = {
      undo = "reset HEAD~1 --mixed";
      amend = "commit -a --amend";
    };
    extraConfig = {
      init.defaultBranch = "development";
      pull = {
        rebase = true;
      };
      branch = {
        autosetupmerge = true;
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}

