# .dotfiles

# TMUX Cheat Sheet For the Important Things To Me

## Creating & Managing Sessions
- `tmux` → Start a new session  
- `tmux new -s <session-name>` → Start a new session with a specific name  
- `tmux ls` → List all active sessions  
- `tmux attach -t <session-name>` → Attach to a specific session  
- `tmux a` → Attach to the last active session  
- `<prefix> + s` → View and switch between sessions inside Tmux  

## Windows Management
- `<prefix> + w` → View all windows and navigate between them  
- `<prefix> + d` → Detach from the current session  
- `<prefix> + &` → Close the current window  
- `<prefix> + c` → Create a new window  
- `<prefix> + n` → Switch to the next window  
- `<prefix> + p` → Switch to the previous window  
- `<prefix> + <window-index>` → Jump to a specific window by index  

## Splitting Panes
- `<prefix> + %` → Split pane horizontally  
- `<prefix> + "` → Split pane vertically  

## Pane Navigation & Management
- `<prefix> + arrow keys` → Move between panes  
- `<prefix> + <pane-number>` → Jump to a specific pane  
- `<prefix> + z` → Toggle full-screen mode for the active pane  

## Copy Mode
- `<prefix> + [` → Enter copy mode  

## Keybindings
- `v` (in copy mode) → Start text selection
- `Ctrl + v` (in copy mode) → Toggle rectangle selection mode
- `y` (in copy mode) → Copy selection and exit copy mode
- `Shift + Left Arrow` → Switch to the previous window
- `Shift + Right Arrow` → Switch to the next window
