# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export TERM="tmux-256color"
export EDITOR=neovim
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="agnoster"

# Configuracion POWERLVEL9K
# POWERLEVEL9K_MODE='awesome-fontconfig'
# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_left"

# Elementos de la barra
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh anaconda virtualenv dir_writable dir vcs status )
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(load ram rbenv time)
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_DIR_HOME_BACKGROUND='09'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='09'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='09'
POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='236'

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='015'
POWERLEVEL9K_OS_ICON_FOREGROUND='001'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'

POWERLEVEL9K_PYTHON_ICON=$'\uF81F'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='24'

# `git hub colors`
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='119'
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

POWERLEVEL9K_HOME_ICON='\uF7DB'
# POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON='\uE18D'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=( 
		 colorize
		 #take 
		 z 
		 virtualenv
		 virtualenvwrapper 
		 python 
		 #zsh-syntax-highlighting 
		 colored-man-pages 
		 last-working-dir 
		 # notify 
		 web-search
		 node
	    )

export ZSH=/home/rahul/.oh-my-zsh

# User configuration

export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

# Use oh-my-zsh
source $ZSH/oh-my-zsh.sh

# virtualenv and virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

alias tmux="tmux -u"
alias vim="nvim"
alias vifm="vifm -c ':only'"
alias fzf="fzf --height 40%"
alias weather="curl http://wttr.in/south+jordan"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitfile="git log --stat"
alias nautilus="nautilus .  >/dev/null 2>&1 & disown"
alias thunar="thunar .  >/dev/null 2>&1 & disown"
alias wikisync="cd ~/Documents/personal/wikiNotes; git status; git add . ; git commit -m 'syncing file'; git push"

bindkey '^ ' autosuggest-accept
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

function vimchage {
	export pwdpath=`pwd`
	cd ~/Documents/personal/wikiNotes 
	vim +VimwikiIndex
	cd $pwdpath
}
function openapp {
	xdg-open $1 2>/dev/null & disown
}
function surfopen {
	surf $1 2>/dev/null & disown
}

alias vimwiki='vimchage'
alias open='openapp'
alias surf='surfopen'

# new terminal tab is opened in pwd
[[ -f /etc/profile.d/vte.sh ]] && . /etc/profile.d/vte.sh


# ========Scrolling========
TranslateWheelToCursor=on
DisableWheelToCursorByCtrl=on

#Start Tmux by default
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -u
fi


# scp no_globing
alias scp='noglob scp_wrap'
function scp_wrap {
  local -a args
  local i
  for i in "$@"; do case $i in
    (*:*) args+=($i) ;;
    (*) args+=(${~i}) ;;
  esac; done
  command scp "${(@)args}"
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/rahul/Documents/apps/Go/bin

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rahul/Documents/software/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rahul/Documents/software/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rahul/Documents/software/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rahul/Documents/software/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
