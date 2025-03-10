{pkgs, config, lib, ...}:

{

    home.pointerCursor = {
        name = lib.mkForce "Bibata-Modern-Classic";
        package = lib.mkForce pkgs.bibata-cursors;
        size = lib.mkForce 24;
        gtk.enable = lib.mkForce true;
        x11.enable = lib.mkForce true;
        x11.defaultCursor = lib.mkForce "Bibata-Modern-Classic";
    };
    gtk = {
        enable = true;
        cursorTheme.name = lib.mkForce "Bibata-Modern-Classic";
        cursorTheme.package = lib.mkForce pkgs.bibata-cursors;
        cursorTheme.size = lib.mkForce 24;
    };

    # hyprland uwsm env config
    xdg.configFile = {
        "uwsm/env".text = ''
            export XCURSOR_THEME=Bibata-Modern-Classic
            export XCURSOR_SIZE=24
            export HYPRCURSOR_THEME=Bibata-Modern-Classic
            export HYPRCURSOR_SIZE=24
            export env = QT_QPA_PLATFORM,wayland
            export env = GDK_BACKEND,wayland
            export env = NIXOS_OZONE_WL,1
            exprot env = GDK_SCALE,2
            export env = ELECTRON_OZONE_PLATFORM_HINT,wayland
        
        
        '';
        "uwsm/env-hyprland".text = ''
            export HYPRCURSOR_THEME=Bibata-Modern-Classic
            export HYPRCURSOR_SIZE=24
        '';

    };

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
        settings = {
            exec-once = [
                "uwsm app -- fcitx5 -d"
                "uwsm app -- wshowkeys -f #${config.lib.stylix.colors.base0E} -b #${config.lib.stylix.colors.base08} -s #${config.lib.stylix.colors.base0A} -t 1000 -a right -a bottom"
            ];
            # Monitor
            monitor = [
                ", 2880x1800@120, auto, 2"
                "DP-1, 3840x2160@160, auto, 2"
            
            ];

            xwayland = {
                force_zero_scaling = true;
            };

            bind = [
                # Launch Terminal
                "SUPER, RETURN, exec, uwsm app -- kitty"

                # Launch Browser
                "SUPER, B, exec, uwsm app -- qutebrowser"

                # Launch fuzzel
                "SUPER, E, exec, uwsm app -- fuzzel"

                # Lock Screen
                "SUPER, L, exec, uwsm app -- loginctl lock-session"

                # Sound Control
                ", XF86AudioRaiseVolume, exec, uwsm app -- wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
                ", XF86AudioLowerVolume, exec, uwsm app -- wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
                ", XF86AudioMute, exec, uwsm app -- wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

                # Brightness Control    
                ", XF86MonBrightnessUp, exec, uwsm app -- brightnessctl set +5%"
                ", XF86MonBrightnessDown, exec, uwsm app -- brightnessctl set 5%-%"
                
                # Media Control
                ", XF86AudioPlay, exec, uwsm app --  playerctl play-pause"
                ", XF86AudioPause, exec, uwsm app -- playerctl play-pause"
                ", XF86AudioNext, exec, uwsm app -- playerctl next"
                ", XF86AudioPrev, exec, uwsm app -- playerctl previous"

                "SUPER, Q, killactive"
                "SUPER+SHIFT, Q, exec, uwsm app -- hyprctl kill"
                
                # Move focus in direction with vim-like keybindings
                "SUPER, H, movefocus, l"
                "SUPER, L, movefocus, r"
                "SUPER, J, movefocus, d"
                "SUPER, K, movefocus, u"

                # Move window in direction with vim-like keybindings
                "SUPER+ALT, H, movewindow, l"
                "SUPER+ALT, L, movewindow, r"
                "SUPER+ALT, J, movewindow, d"
                "SUPER+ALT, K, movewindow, u"

                # Change window size
                "SUPER+SHIFT, H, resizeactive, -10 0"
                "SUPER+SHIFT, L, resizeactive, 10 0"
                "SUPER+SHIFT, J, resizeactive, 0 10"
                "SUPER+SHIFT, K, resizeactive, 0 -10"

                # Fullscreen window
                "SUPER, F, fullscreen"

                # Switch workspace
                "SUPER, 1, workspace, 1"
                "SUPER, 2, workspace, 2"
                "SUPER, 3, workspace, 3"
                "SUPER, 4, workspace, 4"
                "SUPER, 5, workspace, 5"
                "SUPER, 6, workspace, 6"
                "SUPER, 7, workspace, 7"
                "SUPER, 8, workspace, 8"
                "SUPER, 9, workspace, 9"
                "SUPER, 0, workspace, 10"
                "SUPER, Tab, workspace, +1"
                "SUPER+SHIFT, Tab, workspace, -1"

                # Move window to workspace  
                "SUPER+SHIFT, 1, movetoworkspace, 1"
                "SUPER+SHIFT, 2, movetoworkspace, 2"
                "SUPER+SHIFT, 3, movetoworkspace, 3"
                "SUPER+SHIFT, 4, movetoworkspace, 4"
                "SUPER+SHIFT, 5, movetoworkspace, 5"
                "SUPER+SHIFT, 6, movetoworkspace, 6"
                "SUPER+SHIFT, 7, movetoworkspace, 7"
                "SUPER+SHIFT, 8, movetoworkspace, 8"
                "SUPER+SHIFT, 9, movetoworkspace, 9"
                "SUPER+SHIFT, 0, movetoworkspace, 10"
                
                "SUPER, S, togglespecialworkspace, magic"
                "SUPER, S, movetoworkspace, +0"
                "SUPER, S, togglespecialworkspace, magic"
                "SUPER, S, movetoworkspace, special:magic"
                "SUPER, S, togglespecialworkspace, magic"

                
                




            ];

            general = {
                border_size = 2;
                no_border_on_floating = true;
                gaps_in = 5;
                gaps_out = 5;
                gaps_workspaces = 5;
                layout = "dwindle";
                no_focus_fallback = true;
                resize_on_border = false;
                allow_tearing = false;

            };

            decoration = {
                rounding = 10;
                rounding_power = 2.0;
                active_opacity = 0.85;
                inactive_opacity = 0.8;
                fullscreen_opacity = 1;
                dim_inactive = true;
                dim_strength = 0.2;
                dim_special = 0.2;

                blur = {
                    enabled = true;
                    size = 8;
                    passes = 4;
                    ignore_opacity = false;
                    new_optimizations = true;
                    xray = true;
                    popups = true;
                    input_methods = true;
                };     
                
                shadow = {
                    enabled = false;
                };
            };

            animations = {
                enabled = true;
                bezier = [
                    "linear, 0, 0, 1, 1"
                    "md3_standard, 0.2, 0, 0, 1"
                    "md3_decel, 0.05, 0.7, 0.1, 1"
                    "md3_accel, 0.3, 0, 0.8, 0.15"
                    "overshot, 0.05, 0.9, 0.1, 1.1"
                    "crazyshot, 0.1, 1.5, 0.76, 0.92"
                    "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
                    "menu_decel, 0.1, 1, 0, 1"
                    "menu_accel, 0.38, 0.04, 1, 0.07"
                    "easeInOutCirc, 0.85, 0, 0.15, 1"
                    "easeOutCirc, 0, 0.55, 0.45, 1"
                    "easeOutExpo, 0.16, 1, 0.3, 1"
                    "softAcDecel, 0.26, 0.26, 0.15, 1"
                    "md2, 0.4, 0, 0.2, 1"
                ];
                animation = [
                    "windows, 1, 3, md3_decel, popin 60%"
                    "windowsIn, 1, 3, md3_decel, popin 60%"
                    "windowsOut, 1, 3, md3_accel, popin 60%"
                    "border, 1, 10, default"
                    "fade, 1, 3, md3_decel"
                    "layersIn, 1, 3, menu_decel, slide"
                    "layersOut, 1, 1.6, menu_accel"
                    "fadeLayersIn, 1, 2, menu_decel"
                    "fadeLayersOut, 1, 4.5, menu_accel"
                    "workspaces, 1, 7, menu_decel, slide"
                    "specialWorkspace, 1, 3, md3_decel, slidevert"
                ];

            };

            # Input
            input = {
                kb_layout = "us";
                
                
                numlock_by_default = true;


                touchpad = {
                    disable_while_typing = true;
                    natural_scroll = true;
                    scroll_factor = 0.9;
                    tap-to-click = true;
                    tap-and-drag = true;
                    clickfinger_behavior = true;
                    drag_lock = true;
                };
            };

            gestures = {
                workspace_swipe = true;
                workspace_swipe_fingers = 3;
                workspace_swipe_distance = 600;
                workspace_swipe_cancel_ratio = 0.3;
                workspace_swipe_min_speed_to_force = 5;
                workspace_swipe_direction_lock = true;
                workspace_swipe_direction_lock_threshold = 10;
                workspace_swipe_create_new = false;
            };

            misc = {
                vfr = true;
                disable_hyprland_logo = true;
                key_press_enables_dpms = true;
                animate_manual_resizes = true;
                focus_on_activate = true;
                new_window_takes_over_fullscreen = 2;

            };



        };
    };
}
