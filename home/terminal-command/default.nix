{ pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        shellIntegration.enableFishIntegration = true;
        settings = {
            confirm_os_window_close = 0;
            cursor_trail = 3;
        };
    };

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        historySubstringSearch.enable = true;
        
        # 在初始化时运行 fastfetch，但避免在嵌套终端中执行
        initExtra = ''
            # 只在交互式会话且没有设置 FASTFETCH_DISPLAYED 环境变量时运行
            if [[ -o interactive ]] && [[ -z "$FASTFETCH_DISPLAYED" ]]; then
                fastfetch
                export FASTFETCH_DISPLAYED=1
            fi
        '';
    };

    home.packages = with pkgs; [
        neofetch
    ];

    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "$HOME/NixOS/home/terminal-command/logo.png";
                height = 18;
                padding = {
                    top = 1;
                    right = 1;
                };
            };
            display = {
                separator = "   ";
            };
            modules = [
                {
                    type = "command";
                    key = "  ";
                    keyColor = "blue";
                    text = "splash=$(hyprctl splash);echo $splash";
                }
                {
                    type = "custom";
                    format = "┌──────────────────────────────────────────┐";
                }
                {
                    type = "chassis";
                    key = "  󰇺 Chassis";
                    format = "{1} {2} {3}";
                }
                {
                    type = "os";
                    key = "   OS";
                    format = "{2}";
                    keyColor = "red";
                }
                {
                    type = "kernel";
                    key = "   Kernel";
                    format = "{2}";
                    keyColor = "red";
                }
                {
                    type = "packages";
                    key = "  󰏗 Packages";
                    keyColor = "green";
                }
                {
                    type = "display";
                    key = "  󰍹 Display";
                    format = "{1}x{2} @ {3}Hz [{7}]";
                    keyColor = "green";
                }
                {
                    type = "terminal";
                    key = "   Terminal";
                    keyColor = "yellow";
                }
                {
                    type = "wm";
                    key = "  󱗃 WM";
                    format = "{2}";
                    keyColor = "yellow";
                }
                {
                    type = "custom";
                    format = "└──────────────────────────────────────────┘";
                }
                "break"
                {
                    type = "title";
                    key = "  ";
                    format = "{6} {7} {8}";
                }
                {
                    type = "custom";
                    format = "┌──────────────────────────────────────────┐";
                }
                {
                    type = "cpu";
                    format = "{1} @ {7}";
                    key = "  󰻠 CPU";
                    keyColor = "blue";
                }
                {
                    type = "gpu";
                    format = "{1} {2}";
                    key = "  󰊴 GPU";
                    keyColor = "blue";
                }
                {
                    type = "gpu";
                    format = "{3}";
                    key = "   GPU Driver";
                    keyColor = "magenta";
                }
                {
                    type = "memory";
                    key = "  󰘨 Memory ";
                    keyColor = "magenta";
                }
                {
                    type = "command";
                    key = "  󱦟 OS Age ";
                    keyColor = "red";
                    text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
                }
                {
                    type = "uptime";
                    key = "  󱫐 Uptime ";
                    keyColor = "red";
                }
                {
                    type = "custom";
                    format = "└──────────────────────────────────────────┘";
                }
                {
                    type = "colors";
                    paddingLeft = 2;
                    symbol = "circle";
                }
                "break"
            ];
        };
    };

    programs.bat = {
        enable = true;
    };

    programs.eza = {
        enable = true;
        icons = "always";
        colors = "always";
        extraOptions = [
            "--modified"
            "--classify=always"
        ];

    };

    programs.fzf = {
        enable = true;
    };

    programs.yazi = {
        enable = true;
    };

    programs.zoxide = {
        enable = true;
        options = [
            "--cmd cd"
        ];
    };

    programs.git = {
        enable = true;
        userName = "elokelears";
        userEmail = "elokelears@gmail.com";
    };

    programs.lazygit = {
        enable = true;
    };

    programs.btop = {
        enable = true;
    };



}
