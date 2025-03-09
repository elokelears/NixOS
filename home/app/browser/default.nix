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
            # 沉浸式翻译
            (pkgs.fetchurl {
                url = "https://download.immersivetranslate.com/immersive-translate.user.js";
                sha256 = "sha256-RlOgLCFUzWXMYi/T8wNptAwLAnMDsnnqkvqWfb/Tx4U=";
            })
            # 谷歌划词翻译
            (pkgs.fetchurl {
                url = "https://update.greasyfork.org/scripts/453186/iTranslator.user.js";
                sha256 = "sha256-BpEnm+wF+VFhb/+oV0DEUddLeTBHkT9O8CUbbwjAPec=";
            })
        ];
    };

    # Set qutebrowser as the default browser by setting the BROWSER environment variable
    home.sessionVariables = {
        BROWSER = "qutebrowser";
    };
}