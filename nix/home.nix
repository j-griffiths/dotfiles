{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "poozer";
  home.homeDirectory = "/home/poozer";
  home.sessionVariables = { EDITOR = "vim"; };

  xsession.enable = true;
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad.hs;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = "PROMPT='%F{green}%n@%m %F{blue}%~ %% %F{white}'";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      keybindings = [
        { key = "Equals";     mods = "Control";     action = "IncreaseFontSize"; }
        { key = "Add";        mods = "Control";     action = "IncreaseFontSize"; }
        { key = "Subtract";   mods = "Control";     action = "DecreaseFontSize"; }
        { key = "Minus";      mods = "Control";     action = "DecreaseFontSize"; }
      ];

     
      shell = "zsh";
      background_opacity = 0.9;
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
    ];
#    extraConfig = "colorscheme gruvbox";
  };

 # services.picom = {
  #  enable = true;
   # inactiveOpacity = "0.8";
   # inactiveDim = "0.15";
  #};
  
  programs.firefox.enable = true;
 
  home.packages = with pkgs; [
    dmenu
    lf
    xmobar
    deluge
    brave
    qbittorrent
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
