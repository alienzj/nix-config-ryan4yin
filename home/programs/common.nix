{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    ripgrep
    yq-go    # https://github.com/mikefarah/yq
    htop

    ## networking tools
    wireshark
    wireguard-tools  # manage wireguard vpn manually, via wg-quick

    # misc
    libnotify
    wineWowPackages.wayland
    xdg-utils

    # productivity
    obsidian
    hugo

    # IDE
    insomnia
    jetbrains.pycharm-community
    # jetbrains.idea-community

    # cloud native
    docker-compose
    kubectl
    kubernetes-helm
    terraform
    pulumi

    # cloud provider
    awscli

    # C
    clang-tools
    clang-analyzer
    lldb
    gnumake
    cmake
    autoconf
    automake
    bison
    cppcheck
    fakeroot
    flex
    gettext
    groff
    libtool
    m4
    patch
    pkgconf
    texinfo
    binutils


    # Golang
    delve
    go
    go-outline
    go-tools
    go2nix
    gomodifytags
    gopls
    gotests
    impl

    # Rust
    rustup

    # nodejs
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn

    # db related
    dbeaver
    mycli
    pgcli

    # desktop
    tdesktop
    discord
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = "mouse on";
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin-mocha";
      };
      themes = {
        Catppuccin-mocha = builtins.readFile (pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme";
          hash = "sha256-qMQNJGZImmjrqzy7IiEkY5IhvPAMZpq0W6skLLsng/w=";
        });
      };
    };

    btop.enable = true;  # replacement of htop/nmon
    exa.enable = true;   # A modern replacement for ‘ls’
    jq.enable = true;    # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
    aria2.enable = true;

    skim = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'exa --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
