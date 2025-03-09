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
    };

    home.packages = with pkgs; [
        neofetch
    ];

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


}
