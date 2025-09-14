{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
                 ##### KEEP NEOVIM BACKGROUND INTACT #####

      # Use a modern $TERM inside tmux and enable truecolor passthrough.
      set -g default-terminal "tmux-256color"
      # Newer tmux (≥3.2): advertise RGB capability
      set -as terminal-overrides ",*:RGB"
      # Fallback for older tmux: advertise 24-bit color as Tc
      set -as terminal-overrides ",xterm-256color:Tc"

      # Never paint the pane contents (this is what usually wrecks nvim bg)
      setw -g window-style 'bg=default'
      setw -g window-active-style 'bg=default'

      # Make borders neon but transparent
      set -g pane-border-style 'fg=colour93'          # pastel magenta
      set -g pane-active-border-style 'fg=colour51'   # bright cyan

      # Keep status/copy/messages transparent (only FG colors)
      set -g status-style 'bg=default,fg=colour51,bold'
      setw -g mode-style 'bg=default,fg=colour51,bold'        # copy-mode
      set -g message-style 'bg=default,fg=colour201,bold'     # prompts

      # Window tabs – transparent backgrounds
      setw -g window-status-style 'bg=default,fg=colour93'
      setw -g window-status-current-style 'bg=default,fg=colour51,bold'
      setw -g window-status-bell-style 'bg=default,fg=colour201,bold'

      # Optional: status content (no backgrounds!)
      set -g status-justify centre
      set -g status-left '#[fg=colour201] TMUX '
      set -g status-right '#[fg=colour51]%Y-%m-%d #[fg=colour201]| #[fg=colour51]%H:%M '
                 #
                 # Mouse mode
            set -g mouse on

            # no bell distractions
            set -g visual-activity off
            set -g visual-bell off
            set -g visual-silence off
            setw -g monitor-activity off
            set -g bell-action none

            # clock mode → vaporwave purple
            setw -g clock-mode-colour colour129

            # copy mode → teal on purple (no bg override)
            setw -g mode-style 'fg=colour51 bold'

            # panes → neon borders (no bg)
            set -g pane-border-style 'fg=colour93'
            set -g pane-active-border-style 'fg=colour51'

            # statusbar → transparent bg, neon fg
            set -g status-position bottom
            set -g status-justify centre
            set -g status-style 'fg=colour51 bold'  # <— no bg set

            # left side → TMUX tag
            set -g status-left '#[fg=colour201] TMUX '

            # right side → retro clock
            set -g status-right '#[fg=colour51] %Y-%m-%d #[fg=colour201]|#[fg=colour51] %H:%M '

            # windows → vaporwave tabs (no bg override)
            setw -g window-status-current-style 'fg=colour51 bold'
            setw -g window-status-current-format ' %I %W %F '

            setw -g window-status-style 'fg=colour93'
            setw -g window-status-format ' %I #[fg=colour51]%W #[fg=colour201]%F '

            setw -g window-status-bell-style 'fg=colour201 bold'

            # messages → neon foreground only
            set -g message-style 'fg=colour201 bold'
    '';

  };
}
