# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/editor"

# Create new window. If no argument is given, window name will be based on
# layout file name.

new_window "editor"

run_cmd "vim"

