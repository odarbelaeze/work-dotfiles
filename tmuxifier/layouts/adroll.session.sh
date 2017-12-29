# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/adroll"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "adroll"; then

  load_window "adroll-servers"
  load_window "editor"
  load_window "console"

  select_window 2

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
