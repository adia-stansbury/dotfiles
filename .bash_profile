# update "PATH"
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin;
export EDITOR='vi';

# source ".sshagentrc" if present
SSHAGENTRC_FILE=$HOME/.sshagentrc;
if [ -f $SSHAGENTRC_FILE ]; then
  source $SSHAGENTRC_FILE;
fi

# Load any local scripts (the filename must end with "sh")
LOCAL_SCRIPTS_DIRECTORY=$HOME/.dotfiles;
if [ -d $LOCAL_SCRIPTS_DIRECTORY ]; then
  for f in `find "$LOCAL_SCRIPTS_DIRECTORY" -type f | \grep "sh$"`; do
    source $f;
  done
fi

# If it exists, load RVM (it *must* be initialized last)
RVM_SCRIPT=$HOME/.rvm/scripts/rvm;
if [ -f $RVM_SCRIPT ]; then
  source $RVM_SCRIPT;
fi

export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PATH="$HOME/.rbenv/bin:$PATH:$HOME/engineering_tools/development"

export NVM_DIR="/Users/astansbury/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# brew install/upgrade bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"
