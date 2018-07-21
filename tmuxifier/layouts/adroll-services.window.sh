# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/adroll-services"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "adroll-services"

# Split window into panes.
#split_v 20
split_h 50

# Run commands.
run_cmd "docker-compose up --build" 0
run_cmd "while true; do hologram use engineer; echo 'Hologramer: Will engineer you again in a few momments'; sleep 600; done" 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0