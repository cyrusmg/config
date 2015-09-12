#
# ~/.bashrc
#

# AutoStart X on login on tty1
if [[ "$(tty)" == '/dev/tty1' ]]; then
  exec startx
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=vim
export EDITOR="$VISUAL"

source ~/.config/git-prompt.sh
PS1="\$(RET=\$?; [[ \$RET != 0 ]] && echo -n '['\$RET'] ')"
PS1+="\[\e[1;34m\]\W\[\e[m\]"
PS1+="\$(__git_ps1 ' (%s)')"
PS1+=" \$ "

alias grep='grep --color=auto'
alias more='less'
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep'         # requires an argument

if (( UID != 0 )); then
  alias sudo='sudo '
  alias reboot='systemctl reboot'
  alias poweroff='systemctl poweroff'
  alias shutdown='systemctl poweroff'
  alias suspend='systemctl suspend'
  alias update='sudo pacman -Su'
fi

alias l='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'

alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'

alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
alias ..='cd ..'

export PATH="${HOME}/.gem/ruby/2.2.0/bin:${PATH}"
export PATH="${HOME}/.bin/:${PATH}"
