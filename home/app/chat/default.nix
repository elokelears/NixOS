{ pkgs, ... }:

{
    home.packages = with pkgs; [
        discord

        wechat-uos

        qq
    ];
}