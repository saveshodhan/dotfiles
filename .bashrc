# generic aliases
alias crontab="crontab -i"
alias cd..="cd .."
alias ll='ls -alFh --group-directories-first'
alias llp='ll *.py'
alias lld="ll | grep ^d"
alias mps="ps aux | grep 'python' | grep $USER"
alias tree="tree -A -C"
alias lesf="less +F"
alias vi='vim'
alias vr='vim -R'
alias mgrep='grep -Hnr --exclude tags --exclude *.pyc --exclude-dir venv --exclude-dir coverage'
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
alias gd="git diff"
alias gst="git status"
alias gdt="git difftool"

# kubectl realted aliases
alias kcl="kubectl"

# kubectl get pods #
kgp(){
    if [ "$1" == "" ];
    then
        kcl get pods;
    else
        kcl get pods | grep $1;
    fi
}
alias kgc="kcl config get-contexts"
alias kpf="kcl port-forward"

# watch kubectl get pods #
kwp(){
    if [ "$1" == "" ];
    then
        watch `kubectl get pods`;
    else
        watch `kubectl get pods | grep --color=never $1`;
    fi
}

# kubectl logs with filters #
klogs(){
    kcl logs -f $1 | egrep -v '_healthz|_readyz|prometheus_scheduler|swagger' | jq -R 'fromjson?'
}

kxec(){
    kcl exec -it $1 bash
}
