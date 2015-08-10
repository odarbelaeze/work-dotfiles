# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/django"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "django"

# Split window into panes.
split_v 50

# Run commands.
run_cmd "python manage.py runserver" 0
run_cmd "python manage.py shell" 1

# Set active pane.
select_pane 1
