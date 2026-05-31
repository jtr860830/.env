{ config, ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    includes = [
      "${config.xdg.dataHome}/lima/*/ssh.config"
    ];

    settings."*".IdentityAgent =
      ''"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
  };
}
