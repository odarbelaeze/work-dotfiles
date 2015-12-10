# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/rust"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "rust"

# Split window into panes.
split_h 40
split_v 50

# Run commands.
run_cmd "vim"                                               0
run_cmd "filewatcher '**/*.rs Cargo.toml' 'cargo run'"      1
run_cmd "filewatcher '**/*.rs Cargo.toml' 'cargo test'"     2

# Set active pane.
select_pane 0
