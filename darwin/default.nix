{ pkgs, ... }: {
  imports = [ ./system.nix ./homebrew.nix ];

  programs.fish.enable = true;
  users.users.jtr860830 = {
    shell       = pkgs.fish;
    description = "Josh Hsieh";
    home        = "/Users/jtr860830";
  };

  system.primaryUser = "jtr860830";

  nixpkgs.config.allowUnfree = true;

  fonts.packages = [ pkgs.maple-mono."NF-CN" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.use-xdg-base-directories = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
}
