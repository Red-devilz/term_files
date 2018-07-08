
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="agnoster"

# Configuracion POWERLVEL9K
POWERLEVEL9K_MODE='awesome-patched'



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
source /usr/local/bin/virtualenvwrapper.sh


alias Bluetooth="sudo modprobe ath3k btusb bluetooth"
alias tmux="tmux -u"
alias Weather="curl http://wttr.in/"
alias Soundwire="~/Documents/SoundWireServer/SoundWireServer"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitfile="git log --stat"
alias vimwiki="cd ~/Documents/vim/wiki && vim +VimwikiIndex"
alias todo="vim ~/Documents/vim/wiki/Todo.wiki"
alias jabref="java -jar ~/Documents/bib/JabRef-4.1.jar >/dev/null 2>&1 &; disown"
alias zotero="~/Documents/bib/Zotero/zotero >/dev/null 2>&1 &; disown"
alias trello="~/Documents/trello/Trello-linux-0.1.9/Trello >/dev/null 2>&1 &; disown"
alias nautilus="nautilus .  >/dev/null 2>&1 & disown"
alias wikisync="cd ~/Documents/vim/wiki; git status; git add . ; git commit -m 'syncing file'; git push"

myfunction1() {
    ssh -D8080 -q rrahul@10.6.15.$1
}
alias Connect=myfunction1

myfunction3() {
    source $1/bin/activate
}
alias Activate=myfunction3

myfunction4() {

	OUT="$(tabbed -cd -n zathura zathura $1 -e 2>/dev/null )"
	wmctrl -ir $OUT -b add,maximized_vert,maximized_horz

}
alias zathura=myfunction4
#=======  SSH ===========================

# ssh-add ~/.ssh/*.pem >/dev/null 2>&1


# ssh shortcuts
alias ssh_gpu='ssh -i "rlkey.pem" ubuntu@ec2-34-239-228-0.compute-1.amazonaws.com'

#================================================

# new terminal tab is opened in pwd
[[ -f /etc/profile.d/vte.sh ]] && . /etc/profile.d/vte.sh

# Scala can be accessed
export SCALA_HOME=/usr/local/src/scala/scala-2.10.4
export PATH=$SCALA_HOME/bin:$PATH

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

# Ctr + E = SIGINT
# stty intr ^E

longc(){
    start=$(date +%s)
    "$@"
    [ $(($(date +%s) - start)) -le 15 ] || notify-send "Command Executed" "\
 \"$(echo $@)\" took $(($(date +%s) - start)) seconds"
}


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


export TRELLO_USER=rahul.ramesh10@yahoo.co.in
export TRELLO_TOKEN=ef0328632cc949f448ca59a1fdaf4d50e86c8d4b9c109000c1cc98d6ee445e7a
export TRELLO_KEY=fd9537f35d04a90d06fcd66441fdd72d

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

