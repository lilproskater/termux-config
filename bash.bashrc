# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth

# Default command line prompt.
PROMPT_DIRTRIM=2
# PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\] '

# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

[ -r /data/data/com.termux/files/usr/share/bash-completion/bash_completion ] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion


##### CUSTOM #####

# Aliases
alias vidres='ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 $1'
alias minfo='mediainfo --fullscan $1'
alias wp='shred -zfun 50'
alias ch='HISTFILE=/dev/null && wp ~/.bash_history 2> /dev/null'
alias cdetc='cd /data/data/com.termux/files/usr/etc'
alias cdst='cd /storage/emulated/0'

# Prompt
sym=" 👑 " #symbol of prompt
bar_cr="34" #color of bars
name_cr="32" #color of user
host_cr="31" # color of host
end_cr="32" #color of prompt end
dir_cr="36" #color of current directory
user_name="lilproskater"
export USER=$user_name

PS1='\[\033[0;${bar_cr}m\]┌──(\[\033[1;${name_cr}m\]${user_name}${sym}\[\033[1;${host_cr}m\]\h\[\033[0;${bar_cr}m\])-[\[\033[0;${dir_cr}m\]\W\[\033[0;${bar_cr}m\]]
\[\033[0;${bar_cr}m\]└─\[\033[1;${end_cr}m\]\$\[\033[0m\] '

# Enable color support of ls, grep and ip, also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip -color'
fi

# Extend PATH
PATH=$PATH:/data/data/com.termux/files/usr/bin
PATH=$PATH:/data/data/com.termux/files/usr/local/bin

# Clear and init
alias clr='clear && intro'
clr
