{ pkgs, ... }: {

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      #-------- STARTUP PROGRAMS --------
      exec-once = [ "${pkgs.waybar}/bin/waybar" ];
      #----------------------------------

      #-------- ENV --------
      env = [ "WLR_NO_HARDWARE_CURSORS,1" "XCURSOR_SIZE,24" ];
      #---------------------

      #--------------------- ANIMATIONS ---------------------
      animations = {
        enabled = true;
        bezier = [
          "fast, 0.2, 0.5, 0.2, 1.0" # fast ease-out
          "pop,  0.34, 1.56, 0.64, 1.0" # springy pop
          "lin,  0.00, 0.00, 1.00, 1.00" # linear
        ];
        # NOTE: lower duration => faster feel
        animation = [
          "windows,         1, 3, fast, slide" # window open/move
          "windowsOut,      1, 3, fast, slide" # window close
          "border,          1, 4, lin" # border color change
          "fade,            1, 3, fast" # fade on focus/close
          "workspaces,      1, 4, fast, slide" # workspace change
          "specialWorkspace,1, 4, fast, slide"
        ];

      };
      #------------------------------------------------------
      "$mod" = "ALT";

      bind = [

        "$mod, RETURN, exec, alacritty"
        "$mod, D, exec, rofi -show drun"
        "$mod, Q, killactive,"

        #-------- WORKSPACE SELECTION --------
        # workspace select (<leader>+1..9,0)
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        #-------------------------------------

        #-------- MOVE W WORKSPACE --------
        # move focused window to workspace (<leader>+Shift+<num>)
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        #----------------------------------

        #-------- MOVEMENT WINDOWS --------
        # Focus windows directionally (Vim keys)
        "$mod, j, movefocus, l" # focus left
        "$mod, k, movefocus, d" # focus down
        "$mod, l, movefocus, u" # focus up
        "$mod, ;, movefocus, r" # focus right

        # Focus windows directionally (arrow keys) 
        "$mod, left,  movefocus, l"
        "$mod, down,  movefocus, d"
        "$mod, up,    movefocus, u"
        "$mod, right, movefocus, r"

        # Move the focused window in a direction
        "$mod SHIFT, j, movewindow, l"
        "$mod SHIFT, ;, movewindow, d"
        "$mod SHIFT, l, movewindow, u"
        "$mod SHIFT, k, movewindow, r"
        #----------------------------------

      ];
      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
      input.kb_layout = "us";
      general = {
        gaps_in = 3;
        gaps_out = 8;
        border_size = 1;
      };
      decoration.rounding = 8;
    };
  };
}
