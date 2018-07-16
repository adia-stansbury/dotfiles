# update "PATH"
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin;

# source ".sshagentrc" if present
SSHAGENTRC_FILE=$HOME/.sshagentrc;
if [ -f $SSHAGENTRC_FILE ]; then
  source $SSHAGENTRC_FILE;
fi

# Load any custom init-scripts (the filename *must* end-with "rc")
CUSTOM_INIT_SCRIPTS_DIRECTORY=$HOME/.home_dir/custom;
if [ -d $CUSTOM_INIT_SCRIPTS_DIRECTORY ]; then
  for f in `find "$CUSTOM_INIT_SCRIPTS_DIRECTORY" -type f -o -type l | \grep "rc$"`; do
    source $f;
  done
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
export PATH="$HOME/.rbenv/bin:$PATH"

export NVM_DIR="/Users/astansbury/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# brew install/upgrade bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

function todos {
  cd $HOME/Dropbox/vimwiki/PLM
  vi todos.wiki
}

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
