# Custom environnement variables
export VISUAL=nvim
export EDITOR=$VISUAL

cargo_path=/home/$USER/.cargo/bin
local_path=/home/$USER/.local/bin
emscripten_path=/usr/lib/emscripten
export PATH=${PATH:+${PATH}:}$cargo_path:$local_path:$emscripten_path
