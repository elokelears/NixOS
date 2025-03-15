    {config, pkgs, ...}: {
    imports = [
        ./hardware-configuration.nix
    ];

    # AMD GPU
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.graphics.enable = true;
    boot.initrd.kernelModules = [ "amdgpu" ];

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Networking
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    # Timezone
    time.timeZone = "Asia/Shanghai";

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable mysql
    services.mysql = {
        enable = true;
        package = pkgs.mysql80;
    };
    # Configure console keymap
    console.keyMap = "us";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # InputMethod
    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [
            (fcitx5-rime.override {
                rimeDataPkgs = [nur.repos.definfo.rime-ice];
            })
            fcitx5-configtool
            fcitx5-gtk
            kdePackages.fcitx5-qt
        ];
    };

    # Set the font of the system
    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-color-emoji
            nerd-fonts.fira-code
            nerd-fonts.comic-shanns-mono
            nerd-fonts.jetbrains-mono
            maple-mono-NF
            
        ];
        fontconfig = {
            enable = true;
            defaultFonts = {
                sansSerif = [ "Noto Sans CJK SC" ];
                serif = [ "Noto Serif CJK SC" ];
                emoji = [ "Noto Color Emoji" ];
                monospace = [ "ComicShannsMono Nerd Font" "Maple Mono NF" "Noto Sans Mono CJK SC" "JetBrains Mono" "Fira Code" ];
            };
        };
    };

    # ZSH settings
    programs.zsh = {
        enable = true;
    };

    # Set the default shell to zsh
    users.defaultUserShell = pkgs.zsh;

    # Define a user account.
    users.users.elokelears = {
        isNormalUser = true;
        description = "elokelears";
        extraGroups = [ "networkmanager" "wheel" ];
        useDefaultShell = true;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable flakes and nix-command
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Enable the sound with pipewire
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    # Enable bluetooth
    services.blueman.enable = true;

    # Enable CUPS to print documents
    services.printing.enable = true;

    # Enable the sddm display manager
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    # Enable the desktop environment hyprland gnome
    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };
    
    services.xserver = {
    	enable = true;
    	desktopManager.gnome.enable = true;
    };

    # Enable dae
    services.dae = {
        enable = true;
        configFile = /home/elokelears/Documents/dae/config.dae;
    };

    # Enable wshowkeys to show key clicks
    programs.wshowkeys = {
        enable = true;
    };

    # OS packages
    environment.systemPackages = with pkgs; [
        
        wget
        curl

        # System Control
        brightnessctl
        playerctl

        # notify
        libnotify

        wl-clipboard

        # systemstatus
        libgtop
        

        # bluetooth
    ];

    # Set the state version
    system.stateVersion = "25.05";
}
