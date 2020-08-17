# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/data0/home/shichen/anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/data0/home/shichen/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/data0/home/shichen/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/data0/home/shichen/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/data0/home/shichen/anaconda2/bin:$PATH"  # commented out by conda initialize
#export LD_LIBRARY_PATH=/usr/local/cuda/:/usr/local/cuda/lib64/:/data0/home/shichen/anaconda2/lib:/usr/local/hadoop-2.4.0-hdfs/lib/native:/usr/local/jdk1.8.0_131/jre/lib/amd64/server

# export NODE_HOME=~/shichen/node-v14.6.0-linux-x64
#export PATH=$PATH:$NODE_HOME/bin 
#export NODE_PATH=$NODE_HOME/lib/node_modules
#export PATH="$PATH:/data0/home/shichen/squashfs-root/usr/bin/"
export LD_LIBRARY_PATH=/data0/mysql/lib/mysql:$LD_LIBRARY_PATH

#Tags
export PATH="$PATH:/data0/home/shichen/"
alias maketags='find . -name \*.py -print |xargs python ~/ptags.py'
alias smaketags='find . -name \*.py -print |xargs sudo python ~/ptags.py'
