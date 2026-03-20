{ pkgs, ... }:
{
  home.packages = with pkgs; [
    btop
    ripgrep
    fzf
    bat
    yarn
    vscode-fhs
    eza
    kitty
    font-manager
    papirus-icon-theme
  ];
}
