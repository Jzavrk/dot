# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jiji/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export EDITOR=nvim
export XDG_RUNTIME_DIR=/tmp
export MOZ_ENABLE_WAYLAND=1
cargo_path=/home/jiji/.cargo/bin
local_path=/home/jiji/.local/bin
emscripten_path=/usr/lib/emscripten
export PATH=${PATH:+${PATH}:}$cargo_path:$local_path:$emscripten_path

alias dl-mp3="youtube-dl -x --audio-format=mp3"
# lit exists, and is part of the llvm project

# if tmux is executable, X is running, and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
#if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
#  [ -z "${TMUX}" ] && { tmux attach || tmux; } >/dev/null 2>&1
#fi
