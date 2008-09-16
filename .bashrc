#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\] '


if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#variales
export PATH="/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/bin/perlbin/site:/usr/bin/perlbin/vendor:/bin/perlbin/core:/opt/qt/bin:/opt/java/jre/bin:/home/qianli/bin"
export PAGER="less"
export EDITOR="vim"

#########alias######################
alias ls='ls --color=auto'
alias ll='ls -al'
alias e='emacs -nw'
alias c='clear'
# Lets you search through all available packages simply using 'pacsearch packagename'
alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep "

# sudo pacman -Syu by typing pacup (sudo must be installed and configured first)
alias pacup="sudo pacman -Syu"

# sudo pacman -S by typing pac
alias pac="sudo pacman -S"

# colorized pacman output with pacs alias:
alias pacs="pacsearch"
pacsearch() {
   echo -e "$(pacman -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}

export OOO_FORCE_DESKTOP=gnome
