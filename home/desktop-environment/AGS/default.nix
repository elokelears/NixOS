{ pkgs, ... }:

{
    programs.hyprpanel = {
        enable = true;
        hyprland.enable = true;
        overwrite.enable = true;
        theme = "dracula";

        layout = {
            "bar.layouts" = {
                "0" = {
                    left = [ "dashboard" "workspaces" "windowtitle" ];
                    middle = [ "clock" "media" "cava" ];
                    right = [ "hypridle" "network" "bluetooth" "systray" "volume" "battery" "notifications" ];
                };
            };
        };

        settings = {
            # Set the bar transparent
            theme = {
                font = {
                    name = "ComicShannsMono Nerd Font";
                    
                    size = "0.8rem";    
                };
                bar = {
                    transparent = true;
                    buttons.enableBorders = true;
                    outer_spacing = "0.1em";
                };
            };

            bar = {
                # Automatically detect the icon for the system
                launcher.autoDetectIcon = true;

                workspaces = {
                    showWsIcons = true;
                    showApplicationIcons = true;
                    applicationIconOncePerWorkspace = true;
                     
                };    
                notifications.show_total = true;
                media.show_active_only = true;

                customModules.cava = {
                    showIcon = false;
                    showActiveOnly = true;
                };
                network.label = false;
                customModules.hypridle.label = false;
                bluetooth.label = false;

               
                

                

                

            };

            menus = {
                dashboard.shortcuts.left = {
                    shortcut1 = {
                        icon = "߷";
                        command = "uwsm app -- qutebrowser";
                        tooltip = "qutebrowser";
                    };
                    shortcut3 = {
                        command = "uwsm app -- discord";
                        tooltip = "discord";
                    };
                    shortcut2 = {
                        command = "uwsm app -- spotify";
                        tooltip = "spotify";
                    };
                    shortcut4 = {
                        command = "uwsm app -- fuzzel";
                    };
                };
                power.lowBatteryNotification = true;
                dashboard.stats.enable_gpu = true;
                
            };

            scalingPriority = "hyprland";
            terminal = "kitty";

        };
    };
}
