# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/cats-servers"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "cats-servers"

# Split window into panes.
split_h 50
split_v 50 0

run_cmd "source ./env dev && nvm use && export CONTAINER_HOST=172.16.123.69" 0
run_cmd "source ./env dev && nvm use && export CONTAINER_HOST=173.16.123.69" 1
run_cmd "source ./env dev && nvm use && export CONTAINER_HOST=173.16.123.69" 2

run_cmd "sleep 2 && INTEGRATION=facebook python srv/cats4gold/app.py" 0
run_cmd "pushd www && npm run build -- dev && popd" 1
run_cmd "sleep 2 && pushd srv && rqworker --worker-class='cats4gold.syncer.sentry.SentryAttachedWorker' && popd" 2

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0
