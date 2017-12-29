# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/adroll-servers"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "adroll-servers"

split_h 50
split_v 50
run_cmd "paster serve --reload development.ini" 0

select_pane 1

run_cmd "cd ~/code/gatekeeper && docker-compose up" 2
# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0
