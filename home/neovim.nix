{ pkgs, config, ... }: {
  home.packages = [ pkgs.neovim ];

  home.sessionVariables = {
    EDITOR   = "nvim";
    VISUAL   = "nvim";
    MANPAGER = "nvim +Man!";
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/env/nvim";
}
