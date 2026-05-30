{ ... }: {
  programs.git = {
    enable = true;
    userName  = "Josh Hsieh";
    userEmail = "josh.hsieh@linux.com";

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMeXnA4jq76uzsTYRaIjeXkKM0pk5ARHLrzRbYeczax/";
      signByDefault = true;
    };

    aliases = {
      co = "commit";
      lg = "log --color --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
    };

    delta = {
      enable = true;
      options = {
        syntax-theme           = "TwoDark";
        features               = "side-by-side line-numbers decorations";
        whitespace-error-style = "22 reverse";
      };
    };

    extraConfig = {
      init.defaultBranch  = "main";
      pull.rebase         = true;
      color.ui            = true;
      core.editor         = "nvim";
      gpg.format          = "ssh";
      "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      interactive.diffFilter = "delta --color-only";
      "delta \"decorations\"" = {
        commit-decoration-style = "bold yellow box ul";
        file-style              = "bold yellow ul";
        file-decoration-style   = "none";
      };
    };

    ignores = [
      ".DS_Store"
      "**/.claude/settings.local.json"
    ];
  };
}
