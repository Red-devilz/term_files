# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export TERM="xterm-256color"
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="agnoster"

# Configuracion POWERLVEL9K
# POWERLEVEL9K_MODE='awesome-fontconfig'
# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_left"

# Elementos de la barra
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh virtualenv dir_writable dir vcs status )
POWERLEVEL9K_DISABLE_RPROMPT=true
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status load ram rbenv time)
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_DIR_HOME_BACKGROUND='09'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='09'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='009'
POWERLEVEL9K_DIR_HOME_FOREGROUND='236'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='236'

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='015'
POWERLEVEL9K_OS_ICON_FOREGROUND='001'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'

POWERLEVEL9K_PYTHON_ICON=$'\uF110'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='24'

# `git hub colors`
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='119'
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

# Quitar iconos del inicio
POWERLEVEL9K_HOME_ICON='\uE12C'
# POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON='\uE18D'




# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


plugins=( 
		 colorize
		 take 
		 z 
		 virtualenv
		 virtualenvwrapper 
		 python 
		 zsh-syntax-highlighting 
		 colored-man-pages 
		 last-working-dir 
		 notify 
		 web-search
		 node
	    )

export ZSH=/home/rahul/.oh-my-zsh

# User configuration

# Prompt
zstyle ':notify:*' error-icon "/usr/share/icons/Numix/48/status/error.svg"
zstyle ':notify:*' error-title "Execution Failed"
zstyle ':notify:*' success-title "Succesfully Executed"
zstyle ':notify:*' success-icon "/usr/share/icons/Numix/48/status/stock_check-filled.svg"

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Use oh-my-zsh
source $ZSH/oh-my-zsh.sh

# virtualenv and virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh

alias tmux="tmux -u"
alias cat="bat"
alias open="xdg-open"
alias weather="curl http://wttr.in/"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitfile="git log --stat"
alias nautilus="nautilus .  >/dev/null 2>&1 & disown"
alias wikisync="cd ~/Documents/personal/wikiNotes; git status; git add . ; git commit -m 'syncing file'; git push"

function vimchage {
	export pwdpath=`pwd`
	cd ~/Documents/personal/wikiNotes 
	vim +VimwikiIndex
	cd $pwdpath
}

alias vimwiki='vimchage'

# new terminal tab is opened in pwd
[[ -f /etc/profile.d/vte.sh ]] && . /etc/profile.d/vte.sh

# start  terminal command in new line
# precmd() { print "" }
# PROMPT+='
#' # Newline

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

# export PATH="~/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source "/home/rahul/Documents/apps/Go/src/github.com/sachaos/todoist/todoist_functions.sh"
source "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh"

 export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
