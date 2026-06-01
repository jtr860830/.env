{ pkgs, ... }: {
  programs.neovim = {
    enable      = true;
    withRuby    = false;
    withPython3 = false;
    initLua     = builtins.readFile ../nvim/init.lua;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      blink-cmp
      fzf-lua
      gitsigns-nvim
      nvim-autopairs
      mini-nvim
      onedarkpro-nvim
      dropbar-nvim
      vim-illuminate
      indent-blankline-nvim
      conform-nvim
    ];

    extraPackages = with pkgs; [
      gopls
      typescript-language-server
      pyright
      bash-language-server
      yaml-language-server
      taplo
      prettierd
      ruff
      shfmt
      stylua
      clang-tools
    ];
  };

  xdg.configFile."nvim/lua".source = ../nvim/lua;

  home.sessionVariables = {
    EDITOR   = "nvim";
    VISUAL   = "nvim";
    MANPAGER = "nvim +Man!";
  };
}
