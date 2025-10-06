#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

export FZF_CTRL_T_COMMAND="fd --type f"
export FZF_ALT_C_COMMAND="fd --type d"

export EDITOR="nvim"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"


eval "$(starship init bash)"

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux has-session && tmux attach-session || tmux new-session
fi

# path
export PATH="$PATH:$GOPATH/bin"
