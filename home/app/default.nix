{ pkgs, ... }:

{
    imports = [
        ./browser
        ./chat
        ./code-program
        ./editor
        #./music
        #./video
    ];
}