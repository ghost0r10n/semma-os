{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" "z" "colored-man-pages" "extract" "fzf" "tmux" ];
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };

    initExtra = ''
      setopt HIST_IGNORE_ALL_DUPS
      setopt SHARE_HISTORY
      bindkey -e
      alias ls='ls --color=auto'
      alias ll='ls -lah'
      alias gs='git status -sb'
      alias vim='nvim'
      alias vi='nvim'
    '';
  };

  # Tool for the fzf plugin
  home.packages = [ pkgs.fzf ];
}

