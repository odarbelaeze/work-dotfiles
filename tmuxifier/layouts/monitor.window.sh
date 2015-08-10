# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/monitor"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "monitor"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# Split window into panes.
run_cmd "ssh pcm@172.23.177.80"
run_cmd "htop"

split_v 60
run_cmd "ssh pcm@172.23.177.81"
run_cmd "htop"

split_v 50
run_cmd "ssh pcm@172.23.177.82"
run_cmd "htop"

tmuxifier-tmux select-layout even-vertical
tmuxifier-tmux setw synchronize-panes

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
# select_pane 0
