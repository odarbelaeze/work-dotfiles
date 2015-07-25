# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/django"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "django"

# Run commands.
run_cmd "python manage.py runserver"

