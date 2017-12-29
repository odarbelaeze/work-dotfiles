# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/console"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "console"
run_cmd "cowsay hello"
select_pane 0
