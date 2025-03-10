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