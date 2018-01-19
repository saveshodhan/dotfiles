# generic aliases
alias cd..="cd .."
alias ll='ls -alFh --group-directories-first'
alias llp='ll *.py'
alias lld="ll | grep ^d"
alias mps="ps aux | grep 'python' | grep $USER"
alias tree="tree -A -C"
alias lesf="less +F"
alias vi='vim'
alias vr='vim -R'
pdir() {
    ll /proc/$1/cwd
}

# SVN related aliases
alias svnm='svn st | grep ^M'
alias sst="svn status"
alias svni="svn info"
alias svnd="svn diff"

# Python related aliases
alias actv='source /path/to/python/virtualenv'
alias pythonpdb="python -m pdb"
alias pythonss="python -m SimpleHTTPServer"

# GIT related aliases
alias g="git "
alias gi="git init"
alias gd="git diff"
alias gst="git status"
alias grv="git remote -v"
alias gdt="git difftool"
alias gcom="git commit -am"
