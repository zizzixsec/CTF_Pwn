shopt -s autocd	# Allows auto cd by typing directory name
HISTSIZE= HISTFILESIZE= # Infinite history.

alias vi='vim'
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias l.='ls -d .* --color=auto'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias diff='colordiff'
alias wget='wget -c'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
