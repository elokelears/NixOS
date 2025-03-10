{ pkgs, ... }:

{
    home.packages = with pkgs; [
        firefox
    ];

    programs.qutebrowser = {
        enable = true;
        settings = {
            colors.webpage.darkmode.enabled = true;
            content.javascript.enabled = true;
            content.javascript.clipboard = "access";
            content.notifications.enabled = true;
            content.headers.do_not_track = false;
        };
        greasemonkey = [
            (pkgs.writeText "duckduckgo-dracula-theme.js" ''
                // ==UserScript==
                // @name        DuckDuckGo Dracula Dark Theme
                // @namespace   https://duckduckgo.com/
                // @match       https://duckduckgo.com/settings
                // @grant       none
                // @version     1.0
                // @author      -
                // @description 2/19/2020, 3:26:24 PM
                // ==/UserScript==
                var dracula=["7=282a36","8=f8f8f2","9=50fa7b","ae=t","t=p","s=m","w=n","m=l","o=s","j=282a36","a=p","aa=bd93f9","u=-1","x=f1fa8c","y=44475a","af=1","ai=1","f=1"];for(var i=0;i<dracula.length;i++)document.cookie=dracula[i];
            '')
            (pkgs.fetchurl {
                url = "https://update.greasyfork.org/scripts/498197/Auto%20Skip%20YouTube%20Ads.user.js";
                sha256 = "sha256-Ydd/1GzURAyFpih7JZf/G3UTM9Jkmq6Um/VN4/x8I7k=";
            })
        ];
    };

    # Set qutebrowser as the default browser by setting the BROWSER environment variable
    home.sessionVariables = {
        BROWSER = "${pkgs.qutebrowser}/bin/qutebrowser";
    };

    xdg.mimeApps= {
        enable = true;
        defaultApplications = {
            "text/html" = "qutebrowser.desktop";
            "x-scheme-handler/http" = "qutebrowser.desktop";
            "x-scheme-handler/https" = "qutebrowser.desktop";
            "x-scheme-handler/about" = "qutebrowser.desktop";
            "x-scheme-handler/unknown" = "qutebrowser.desktop";
        };
    };
}