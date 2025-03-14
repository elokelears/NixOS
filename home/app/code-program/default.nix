{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # Cursor IDE the ai code editor 
        code-cursor
        jdk  # 为 Cursor IDE 添加标准 JDK
        maven


        # JetBrains IDEs
        jetbrains.idea-ultimate

        # VSCode
        vscode

    ];

    # 配置 Maven 的本地仓库
}