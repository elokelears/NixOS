{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # Cursor IDE the ai code editor 
        code-cursor

        # JetBrains IDEs
        jetbrains.idea-ultimate
        jdk

        # VSCode
        vscode

    ];
}