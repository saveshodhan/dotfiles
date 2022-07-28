# generic aliases
alias crontab="crontab -i"
alias cd..="cd .."
alias ll='ls -alFh --group-directories-first'
alias llp='ll *.py'
alias lld="ll | grep ^d"
alias mps="ps aux | grep 'python' | grep $USER"
alias tree="tree -A -C -I '*cache*'"
alias lesf="less +F"
alias vi='vim'
alias vr='vim -R'
alias mgrep='grep -Hnr --color=always --exclude=tags --exclude=*.pyc --exclude=*.orig --exclude-dir=venv --exclude-dir=reports --exclude-dir=.git'
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
alias kgc="kcl config current-context"
alias kpf="kcl port-forward"

# kubectx related #
kcc(){
    if [ "$1" == "prod" ]
    then kubectx prod;
    elif [ "$1" == "uat" ]
    then kubectx uat;
    else echo "Invalid value passed for kubectx"
    fi
}

# kubectl get pods #
kgp(){
    if [ "$1" == "" ];
    then
        kcl get pods;
    else
        kcl get pods | awk 'NR==1 || /'$1'/';
    fi
}

# watch kubectl get pods #
kwp(){
    if [ "$1" == "" ];
    then
        watch -n 3 'kubectl get pods';
    else
        watch -n 3 "kubectl get pods | awk 'NR==1 || /'$@'/'";
    fi
}

# kubectl logs with filters #
klogs(){
    kcl logs -f $1 | egrep -v 'logger|prometheus|healthcheck' | jq -R -r '. as $line | try fromjson catch $line'
}

kxec(){
    kcl exec -it $1 bash
}

kenv(){
    kcl exec -it $1 -- bash -c "env"
}

# virtualenvwrapper settings #
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export WORKON_HOME=~/projects/venvs
source ~/.local/bin/virtualenvwrapper.sh

