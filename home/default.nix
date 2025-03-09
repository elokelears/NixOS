{ pkgs, ... }: 

{
    home = {
        username = "elokelears";
        homeDirectory = "/home/elokelears";
        stateVersion = "25.05";
    };

    imports = [
        ./app
        ./desktop-environment
        ./terminal-command
    ];

    programs.home-manager.enable = true;


    # theme of home
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
        fonts = {
            serif = {
                name = "Noto Sans CJK SC";
                package = pkgs.noto-fonts-cjk-serif;
            };
            sansSerif = {
                name = "Noto Sans CJK SC";
                package = pkgs.noto-fonts-cjk-sans;
            };
            monospace = {
                name = "ComicShannsMono Nerd Font";
                package = pkgs.nerd-fonts.comic-shanns-mono;
            };
            emoji = {
                name = "Noto Color Emoji";
                package = pkgs.noto-fonts-color-emoji;
            };
        };
    };
}
