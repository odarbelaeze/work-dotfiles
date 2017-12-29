# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/cats-servers"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "cats-servers"

# Split window into panes.
split_h 50
split_v 50
split_v 50 0

run_cmd "source ./env dev && nvm use && export PYTHONPATH=./srv:$PYTHONPATH && export CONTAINER_HOST=10.62.88.5" 0
run_cmd "source ./env dev && nvm use && export PYTHONPATH=./srv:$PYTHONPATH && export CONTAINER_HOST=10.62.88.5" 1
run_cmd "source ./env dev && nvm use && export PYTHONPATH=./srv:$PYTHONPATH && export CONTAINER_HOST=10.62.88.5" 2
run_cmd "source ./env dev && nvm use && export PYTHONPATH=./srv:$PYTHONPATH && export CONTAINER_HOST=10.62.88.5" 3

run_cmd "sleep 2 && python srv/app.py" 0
run_cmd "pushd www && npm run build -- dev && popd" 1
run_cmd "sleep 2 && pushd srv && rqworker --worker-class='syncer.sentry.SentryAttachedWorker' && popd" 2
run_cmd "while true; do hologram use engineer; echo 'Hologramer: Will engineer you again in a few momments'; sleep 600; done" 3

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0
