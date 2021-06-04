# clipboard
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias ctrlc=pbcopy
alias ctrlv=pbpaste

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias pip=pip3
alias python=python3

alias gocov='go test -coverprofile=cover.out && go tool cover -html=cover.out'

alias qfind='find . -name'
