#
# ~/.bashrc
#

# AutoStart X on login on tty1
if [[ "$(tty)" == '/dev/tty1' ]]; then
  exec startx

## SWAY WM
# export XKB_DEFAULT_LAYOUT=cz
# export XKB_DEFAULT_VARIANT=gb-accute

# exec sway
fi

export SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock

source /usr/share/nvm/init-nvm.sh
test -f /usr/share/nvm/init-nvm.sh || echo Run: yaourt -S nvm

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


[[ $TERM == xterm-termite ]] && export TERM=xterm
# [[ $TERM == alacritty ]] && export TERM=xterm

export VISUAL=vim
export EDITOR="$VISUAL"

source ~/.config/git-prompt.sh
PS1="\$(RET=\$?; [[ \$RET != 0 ]] && echo -n '['\$RET'] ')"
PS1+="\[\e[1;34m\]\W\[\e[m\]"
PS1+="\$(__git_ps1 ' (%s)')"
PS1+=" \$ "

alias ag='ag -W 100 --ignore node_modules '
alias grep='grep --color=auto'
alias more='less'
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep'         # requires an argument
alias serve='python3 -m http.server'
alias wifi-status='nmcli dev wifi'
alias code-pr='code --enable-proposed-api GitHub.vscode-pull-request-github' # run VS Code with PR feature enabled
alias feh='feh --auto-rotate'

if (( UID != 0 )); then
  alias sudo='sudo '
  alias reboot='systemctl reboot'
  alias poweroff='systemctl poweroff'
  alias shutdown='systemctl poweroff'
  alias suspend='systemctl suspend'
  alias update='sudo pacman -Syu'
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

alias kill_plack='kill $(lsof -t -i:8080)'
alias kill_express='kill $(lsof -t -i:4000)'

alias in-mongo-docker='docker run -u $(id -u ${USER}):$(id -g ${USER}) -w /mount --rm -it --net=host -v ${PWD}:/mount mongo:4.0.9'
alias mongo='echo "Connecting to docker..." && in-mongo-docker mongo'
alias mongodump='echo "Connecting to docker..." && in-mongo-docker mongodump'
alias mongorestore='echo "Connecting to docker..." && in-mongo-docker mongorestore'
alias mongoexport='echo "Connecting to docker..." && in-mongo-docker mongoexport'
alias mongoimport='echo "Connecting to docker..." && in-mongo-docker mongoimport'
alias bsondump='echo "Connecting to docker..." && in-mongo-docker bsondump'
alias p='pm2'
alias tt='node ~/src/teletext/index.js'

alias monitor-above='xrandr --output HDMI2 --auto --above eDP1'
alias monitor-right='xrandr --output HDMI2 --auto --right-of eDP1'
alias monitor-left='xrandr --output HDMI2 --auto --left-of eDP1'
alias monitor-left-scale='xrandr --output eDP1 --primary --mode 2560x1440 --pos 2880x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --scale 1.5x1.5 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off'
alias monitor-external='xrandr --output HDMI2 --auto --output eDP1 --off'

# Find file shortcut
function f(){ find . -iname "*$1*"; }
export f

# Convert currencies using CNB. Usage: cnb EUR 1000
function cnb() {
 RATE=`curl -s https://www.cnb.cz/cs/financni_trhy/devizovy_trh/kurzy_devizoveho_trhu/denni_kurz.txt | grep $1 | awk -F'|' '{ print $5; }' | tr ',' '.'`
 calc $RATE*$2
}
export cnb

function atnotify() { echo "notify-send ${@:2}" | at $1; };
export atnotify

export PATH="${HOME}/.gem/ruby/2.3.0/bin:${PATH}"
export PATH="${HOME}/.gem/ruby/2.6.0/bin:${PATH}"
export PATH="${HOME}/.gem/ruby/2.7.0/bin:${PATH}"
export PATH="${HOME}/.local/bin/:${PATH}"
export PATH="${HOME}/.yarn/bin/:${PATH}"
export PATH="${HOME}/.bin/:${PATH}"

export CXX=clang++
export CC=clang

#### GPG AGENT ####
# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# Set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

source /usr/share/bash-completion/bash_completion
test -f /usr/share/bash-completion/bash_completion || echo Run: pacman -S bash-completion
