{ pkgs, lib, ... }: {
  xdg.configFile."ghostty/config".text = ''
    window-padding-balance = true
    mouse-hide-while-typing = true
    quit-after-last-window-closed = true
    confirm-close-surface = false
    selection-clear-on-copy = true
    shell-integration = none

    ${lib.optionalString pkgs.stdenv.isDarwin ''
      macos-icon = glass
      macos-titlebar-style = hidden
      macos-option-as-alt = true
    ''}
    theme = onedarkpro_onedark
    adjust-cell-height = 24%

    font-family = Maple Mono NF CN
    font-size = 14
    font-feature = calt
    font-feature = ss11
  '';

  xdg.configFile."ghostty/themes/onedarkpro_onedark".text = ''
    palette = 0=#282c34
    palette = 1=#e06c75
    palette = 2=#98c379
    palette = 3=#e5c07b
    palette = 4=#61afef
    palette = 5=#c678dd
    palette = 6=#56b6c2
    palette = 7=#abb2bf
    palette = 8=#5c6370
    palette = 9=#e9969d
    palette = 10=#b3d39c
    palette = 11=#edd4a6
    palette = 12=#8fc6f4
    palette = 13=#d7a1e7
    palette = 14=#7bc6d0
    palette = 15=#c8cdd5
    background = #282c34
    foreground = #abb2bf
    cursor-color = #c678dd
    selection-background = #414858
    selection-foreground = #abb2bf
  '';
}
