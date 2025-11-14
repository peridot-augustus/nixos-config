{ config, pkgs, lib, ... }:

{
  options.modules.desktop.kde.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf config.modules.desktop.kde.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma6.enable = true;

    # For Wayland:
    services.displayManager.sddm.wayland.enable = true;

    # Needed for KDE apps
    environment.systemPackages = with pkgs; [
      kdePackages.konsole
      kdePackages.dolphin
      kdePackages.plasma-desktop
    ];
  };
}
