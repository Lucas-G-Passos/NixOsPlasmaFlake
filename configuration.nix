{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  console.keyMap = "br-abnt2";

  users.users.lucas = {
    isNormalUser = true;
    description = "lucas";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "gamemode"
    ];
    shell = pkgs.fish;

  };

  environment.systemPackages = with pkgs; [
    micro
    nixfmt
    nixd
    neovim
    tree
    git
    file
    kdePackages.dolphin
    mindustry-wayland
    vlc
    bottles
    kdePackages.ark
    nix-search-cli
    bibata-cursors
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.jetbrains-mono
    fira-code
  ];

  programs.firefox.enable = true;

  services.tailscale.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam.enable = true;
  programs.java.enable = true;
  programs.fish.enable = true;

  services.pipewire.pulse.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless.enable = true;
    rootless.setSocketVariable = true;
  };
  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];

  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  system.stateVersion = "25.11";

}
