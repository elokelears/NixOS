{ pkgs, ... }:

{
    programs.hyprlock = {
        enable = true;
        settings = {
            background = {
                blur_passes = 2;
                contrast = 1;
                brightness = 0.5;
                vibrancy = 0.2;
                vibrancy_darkness = 0.2;
            };
            general = {
                no_fade_in = true;
                no_fade_out = true;
                hide_cursor = true;
                grace = 0;
                disable_loading_bar = true;
            };
            input-field = {
                size = "250, 60";
                outline_thickness = 2;
                dots_size = 0.3;
                dots_spacing = 0.2;
                dots_center = true;
                fade_on_empty = false;
                rounding = -1;
                placeholder_text = "PassWord ...";
                hide_input = false;
                position = "0, -200";
                halign = "center";
                valign = "center";
            };
        };
    };
}