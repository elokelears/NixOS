{ pkgs, ... }:

{
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                terminal = "uwsm app -- kitty -e";
                placeholder = "🧐 search";
                launch-prefix = "uwsm app --";
            };
        };
    };
}