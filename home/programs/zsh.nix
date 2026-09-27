{pkgs, ...}:
{
      programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" "extract" ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    shellAliases = {
      vim = "nvim";
      make = "make -j$(nproc)";
      ninja = "ninja -j$(nproc)";
      n = "ninja";
      c = "clear";
      jctl = "journalctl -p 3 -xb";
    };

    initContent = ''
      # Fastfetch startup
      if [[ -x $(command -v fastfetch) ]]; then
        fastfetch -c examples/13.jsonc
      fi

      # Options & Exports
      DISABLE_MAGIC_FUNCTIONS="true"
      ENABLE_CORRECTION="true"
      COMPLETION_WAITING_DOTS="true"
     
      export TERM=xterm-256color
      export HISTCONTROL=ignoreboth
      export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"

      export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
      export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

      export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

      #[[ "$TERM" = "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

      # Powerlevel10k configuration loader
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  }
