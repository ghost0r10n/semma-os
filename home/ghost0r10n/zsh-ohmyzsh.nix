{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
      plugins = [ "git" "sudo" "z" "colored-man-pages" "extract" "fzf" "tmux" ];
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };

    initContent = ''
      setopt HIST_IGNORE_ALL_DUPS
      setopt SHARE_HISTORY
      bindkey -e
      alias ls='ls --color=auto'
      alias ll='ls -lah'
      alias gs='git status -sb'
      alias vim='nvim'
      alias vi='nvim'


      #-------- JAVA SETUP --------
      export JAVA_HOME="${pkgs.jdk21}/lib/openjdk"
      export PATH="$JAVA_HOME/bin:$PATH"
      alias mv17i='JAVA_HOME=${pkgs.jdk17}/lib/openjdk mvn clean install'
      #----------------------------
    '';
  };

  # Tool for the fzf plugin
  home.packages = [ pkgs.fzf ];
}
