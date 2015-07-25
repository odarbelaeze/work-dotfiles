# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/code/django-tos"

export VIRTUAL_ENV=$WORKON_HOME/tosenv/

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "djg-tos"; then

  # Load a defined window layout.
  load_window "editor"
  load_window "django"
  load_window "dshell"
  load_window "shell"

  # Select the default active window on session creation.
  #select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
