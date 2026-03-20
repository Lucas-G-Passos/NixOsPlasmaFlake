{
  ...
}:
{
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";
  home.stateVersion = "25.11";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Lucas-G-Passos";
        email = "lucasgodpassos@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  imports = [
    ./configs/packages.nix
    ./configs/shell.nix
    ./configs/plasma.nix
  ];
}
