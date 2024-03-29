# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="candy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/usr/share/zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias matrix='unimatrix -l Aang -s 95'
alias x='startx ~/.config/xinit/xinitrc &> /dev/null;exit'
alias clock='tty-clock -Ssc'
alias wb='curl wttr.in/Botakara\?lang=ru'
alias wk='curl wttr.in/Karaganda\?lang=ru'
alias update='yay -Syu --noconfirm'
alias ls='ls --color=auto'
alias xrdb-reload='xrdb ~/.config/xresources/xresources'

# Загрузка видео с YouTube в лучшем качестве
alias y='youtube-dl -f "bestvideo+bestaudio/bestvideo+bestaudio" --merge-output-format mp4'
# Загрузка плейлиста с YouTube в лучшем качестве
alias yp='youtube-dl -f "bestvideo+bestaudio/bestvideo+bestaudio" --merge-output-format mp4 --yes-playlist'

alias c='code ./'
alias v='source ./venv/bin/activate'

# Отключение возможности включения и отключения numlock
alias n='xmodmap -e "keycode 77="'

# Некоторые часто перезапускаемые службы
alias srf='systemctl restart vsftpd'
alias srs='systemctl restart sshd'
alias srd='systemctl restart docker'

alias watch_docker='watch -n 3 "docker ps --format '"'"'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"'"'"'
alias drb='docker restart backend'
alias drf='docker restart frontend'
alias dab='docker container attach backend'
alias daf='docker container attach frontend'

# Архивация гит репозитория (untracked файлы пропускает)
alias zip-git='git ls-files | zip -@ $(basename "$PWD")'

alias grc='gource -3840x2160 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 ~/gource.mp4'

alias nvidia='cd /media/hdd/arch/scripts/xorg-conf && sudo ./switch.sh nvidia.conf; cd ~'
alias intel='cd /media/hdd/arch/scripts/xorg-conf && sudo ./switch.sh intel.conf; cd ~'

alias lock='export DISPLAY=:0;slock'

alias tree_c='tree -La 5 \
    -I __pycache__ -I .git -I .venv -I pytest-cov-report \
    -I .pytest_cache -I __init__.py -I __main__.py -I venv
'

alias rr='. ranger'
alias rm_pycache='rm -rf $(find ./ -type d -name "__pycache__")'
alias find_blank='grep -r "[[:blank:]]$" -I . \
    --exclude-dir=node_modules \
    --exclude-dir=media \
    --exclude-dir=postgres-data \
    --exclude-dir=__pycache__ \
    --exclude-dir=venv \
    --exclude-dir=static \
'
alias p='python'

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.cache/zsh.history
