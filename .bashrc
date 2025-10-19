#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1="  \[\e[36m\]\W\[\e[0m\]\n└─> "

# Created by `pipx` on 2025-07-26 17:42:30
export PATH="$PATH:/home/nick/.local/bin"

# export PATH=$PATH:/home/nick/.spicetify

d() {
	setsid -f -- "$@" 0<&- &>/dev/null
}

de() {
	d "$@"; exit
}