# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/cluster"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "cluster"

# Split window into panes.
split_v 20
split_v 50

tmuxifier-tmux select-layout even-vertical

# Run commands.
run_cmd "ssh pcm@172.23.177.80" 0
run_cmd "ssh pcm@172.23.177.81" 1
run_cmd "ssh pcm@172.23.177.82" 2

tmuxifier-tmux setw synchronize-panes

