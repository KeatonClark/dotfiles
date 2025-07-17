{ config, pkgs, ... }: {
  home-manager.users.${config.user} = {
    programs.tmux = {
      enable = true;
      keyMode = "vi";
      newSession = true;
      disableConfirmationPrompt = true;
      customPaneNavigationAndResize = true;
      tmuxinator.enable = true;
      terminal = "screen-256color";
      extraConfig = ''
        is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?\.?(view|n?vim?x?)(-wrapped)?(diff)?$'"
        set -g status-left-length 100
        bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
        bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
        bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
        bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

        bind-key -T copy-mode-vi 'C-h' select-pane -L
        bind-key -T copy-mode-vi 'C-j' select-pane -D
        bind-key -T copy-mode-vi 'C-k' select-pane -U
        bind-key -T copy-mode-vi 'C-l' select-pane -R

        bind-key -n 'C-Left' resize-pane -L 1
        bind-key -n 'C-Down' resize-pane -D 1
        bind-key -n 'C-Up' resize-pane -U 1
        bind-key -n 'C-Right' resize-pane -R 1
      '';
    };
  };
}
