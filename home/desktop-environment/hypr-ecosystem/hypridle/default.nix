{ pkgs, ... }:

{
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock";
                before_sleep_cmd = "loginctl lock-session";
                after_sleep_cmd = "hyprctl dispatch dpms on";
            };
            
            listener = [
                {
                    timeout = 300;          # 5分钟后锁屏
                    on-timeout = "loginctl lock-session";
                }
                {
                    timeout = 600;          # 10分钟后关闭屏幕
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
                {
                    timeout = 1200;         # 20分钟后休眠
                    on-timeout = "systemctl hibernate";
                }
            ];
        };
    };
}