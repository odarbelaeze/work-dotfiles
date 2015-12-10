# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/ember-v"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "ember-v"

# Split window into panes.
split_v 35
split_h 50

#dat Run commands.
run_cmd "vim"  0
run_cmd "ember server --proxy http://api.ember-cli-101.com --port 6969" 2

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
