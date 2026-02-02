{ config, pkgs, lib, ... }:
{
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
  ];
  services.xserver = {
    enable = true;
    displayManager = {
      startx = {
        enable = true;
        generateScript = true;
      };
    };
    windowManager = {
      i3 = {
        enable = true;
      };
    };
  };
  home-manager.users.${config.user} = {
    programs.rofi = {
      enable = true;
      theme = "gruvbox-dark";
      plugins = with pkgs; [
        rofi-calc
      ];
      font = "FiraCode Nerd Font Mono 9"; 
      modes = [
        "drun"
        "run"
        "calc"
      ];
      cycle = true;
    };
    programs.i3status-rust = {
      enable = true;
      bars = {
        default = {
          theme = "gruvbox-dark";
          icons =  "material-nf";
        };
      };
    };
    xsession.windowManager.i3 = {
      enable = true;
      config = let
          bg = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          purple = "#b16286";
          aqua = "#689d68";
          gray = "#a89984";
          darkgray = "#1d2021";
      in {
        modifier = "Mod1";
        keybindings = let
          mod = "Mod1";
        in {
          "${mod}+Return" = "exec i3-sensible-terminal";
          "${mod}+x" = "kill";
          "${mod}+p" = "exec ${config.home-manager.users.${config.user}.programs.rofi.finalPackage}/bin/rofi -show drun";
          "${mod}+c" = "exec ${config.home-manager.users.${config.user}.programs.rofi.finalPackage}/bin/rofi -show calc";
          
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
                   
          "${mod}+Shift+q" = "exec i3-msg exit";
        } // lib.listToAttrs (lib.genList (n: {
            name = "${mod}+${toString n}";
            value = "workspace number ${toString n}";
        }) 10)
        // lib.listToAttrs (lib.genList (n: {
            name = "${mod}+Shift+${toString n}";
            value = "move container to workspace number ${toString n}";
        }) 10);
        fonts = {
          names = [ "FiraCode Nerd Font Mono" ];
          style = "Bold";
          size = 11.0;
        };
        window = {
          titlebar = false;
          border = 2;
        };
        floating = {
          titlebar = false;
          border = 2;
        };
        colors = {
          focused = {
            border = blue;
            background = blue;
            text = blue;
            indicator = blue;
            childBorder = blue;
          };
          focusedInactive = {
            border = darkgray;
            background = darkgray;
            text = yellow;
            indicator = purple;
            childBorder = darkgray;
          };
          unfocused = {
            border = darkgray;
            background = darkgray;
            text = yellow;
            indicator = purple;
            childBorder = darkgray;
          };
          urgent = {
            border = red;
            background = red;
            text = bg;
            indicator = red;
            childBorder = red;
          };
        };
        bars = [
          {
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs config-default.toml";
            fonts = {
              names = [ "FiraCode Nerd Font" ];
              style = "Mono";
              size = 11.0;
            };
            colors = {
              activeWorkspace = {
                border = darkgray;
                background = darkgray;
                text = blue;
              };
              focusedWorkspace = {
                border = blue;
                background = blue;
                text = darkgray;
              };
              inactiveWorkspace = {
                border = darkgray;
                background = bg;
                text = gray;
              };
              urgentWorkspace = {
                border = darkgray;
                background = red;
                text = darkgray;
              };
              background = bg;
            };
          }
        ];
      };
    };
    home.sessionVariables = {
      XINITRC = "/etc/X11/xinit/xinitrc";
    };
  };
}
