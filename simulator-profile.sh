export MY_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
export PS1='\u@\h:\w \$ '
export PATH=${SIMULATOR_HOME}/bin:${PATH}

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

