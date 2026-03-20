{ ... }:
{
  programs.plasma = {
    enable = true;

    panels = [
      {
        location = "bottom";
        height = 60;
        hiding = "dodgewindows";
        lengthMode = "fit";
        opacity = "opaque";
        widgets = [
          "org.kde.plasma.icontasks"
        ];
      }
      {
        location = "top";
        height = 38;
        hiding = "normalpanel";
        lengthMode = "fill";
        opacity = "opaque";
        widgets = [
          "org.kde.plasma.kicker"
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.pager"
          "org.kde.plasma.systemtray"
        ];
      }
    ];

    powerdevil = {
      AC = {
        powerButtonAction = "sleep";
        powerProfile = "performance";
      };
      battery = {
        powerButtonAction = "sleep";
        powerProfile = "powerSaving";
      };
    };

    input.touchpads = [
      {
        name = "SynPS/2 Synaptics TouchPad";
        vendorId = "0002";
        productId = "0007";

        tapToClick = true;
        naturalScroll = true;
        disableWhileTyping = true;
        pointerSpeed = 0.1;
        rightClickMethod = "twoFingers";
        twoFingerTap = "rightClick";
      }
    ];

    input.keyboard = {
      layouts = [
        {
          layout = "br";
          variant = "thinkpad";
        }
      ];
    };

    workspace = {
      iconTheme = "Papirus-Dark";
      cursor = {
        animationTime = 5;
        cursorFeedback = "Bouncing";
        size = 24;
        taskManagerFeedback = true;
        theme = "Bibata-Modern-Ice";
      };
    };

    iconTasks = {
      launchers = [
        "applications:org.kde.dolphin.desktop"
        "applications:kitty.desktop"
        "applications:firefox.desktop"
        "applications:code.desktop"
        "applications:steam.desktop"
      ];
    };

    kwin = {
      virtualDesktops = {
        rows = 3;
        number = 9;
      };
      effects = {
        desktopSwitching.navigationWrapping = true;
      };
    };
  };
}
