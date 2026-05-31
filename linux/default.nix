{ hostname, pkgs, ... }: {
  networking.hostName = hostname;

  users.users.jtr860830 = {
    isNormalUser = true;
    shell        = pkgs.fish;
  };

  programs.fish.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion   = "25.05";
}
