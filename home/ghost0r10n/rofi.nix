{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    
    extraConfig = {
      modes = "drun,run,window";
      show-icons = true;
      display-drun = " Apps";
      display-run = " Run";
      display-window = " Windows";
      font = "FiraCode Nerd Font 12";
    };
  };
  
  # Create a custom theme file
  home.file.".config/rofi/themes/dark.rasi".text = ''
    * {
      background: #111318;
      background-alt: #1e1e2e;
      foreground: #e6e9ef;
      selected: #c67db8;
      active: #a6adc8;
      urgent: #f38ba8;
    }

    window {
      background-color: @background;
      border: 2px;
      border-color: @selected;
      border-radius: 10px;
      width: 600px;
      padding: 0px;
    }

    mainbox {
      background-color: @background;
      children: [ inputbar, listview ];
      spacing: 10px;
      padding: 10px;
    }

    inputbar {
      background-color: @background-alt;
      text-color: @foreground;
      border-radius: 8px;
      padding: 10px 15px;
      children: [ prompt, entry ];
      spacing: 10px;
    }

    prompt {
      background-color: @selected;
      text-color: @background;
      border-radius: 6px;
      padding: 4px 8px;
    }

    entry {
      background-color: transparent;
      text-color: @foreground;
      placeholder: "Search...";
    }

    listview {
      background-color: @background;
      columns: 1;
      lines: 8;
      spacing: 4px;
      cycle: true;
      dynamic: true;
      layout: vertical;
    }

    element {
      background-color: @background;
      text-color: @foreground;
      border-radius: 6px;
      padding: 8px;
      spacing: 8px;
    }

    element normal.normal {
      background-color: @background;
      text-color: @foreground;
    }

    element selected.normal {
      background-color: @selected;
      text-color: @background;
    }

    element-icon {
      size: 20px;
      background-color: transparent;
    }

    element-text {
      background-color: transparent;
      text-color: inherit;
    }
  '';
}