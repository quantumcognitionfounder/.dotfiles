# zsh configuration file
zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source antigen plugin manager.
ANTIGEN_PATH=~/
source $HOME/.antigen.zsh

# Antigen init
antigen init .antigenrc

export PATH=$PATH:/usr/local/go/bin

# --------------------------------- ALIASES -----------------------------------

alias ..='cd ..'
alias xclip='xclip -selection c'
# command -v vim > /dev/null && alias vi='vim'

### Colorize commands
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias pacman='pacman --color=auto'

##### Comment if using exa
# ### LS & TREE
# alias ls='ls --color=auto'
# alias ll='ls -la'
# alias la='ls -A'
# alias l='ls -F'
# command -v lsd > /dev/null && alias ls='lsd --group-dirs first' && \
#   alias tree='lsd --tree'
# command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
#   alias tree='colorls --tree'

##### Comment if using ls
## exa
alias ls="exa --icons" # ls
alias ll='exa -l --icons' # list, size, type
alias llm='exa -lG --icons --sort=modified' # long list, modified date sort
alias la='exa -la --icons' # all list
alias lx='exa -lhgUmua --octal-permissions --time-style=long-iso --icons' # all + extended list
alias lt='exa --tree --level=2 --icons --group-directories-first' # tree
alias l='exa -l --icons'
alias tree='exa --tree --level=2 --icons --group-directories-first'

### CAT & LESS
command -v batcat > /dev/null && \
  alias batcat='batcat --theme=ansi-dark' && \
  alias cat='batcat --pager=never' && \
  alias less='batcat'

### TOP
# command -v htop > /dev/null && alias top='htop'
# command -v gotop > /dev/null && alias top='gotop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
# command -v ytop > /dev/null && alias top='ytop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
# command -v btm > /dev/null && alias top='btm $([ "$COLOR_SCHEME" = "light" ] && echo "--color default-light")'
# # themes for light/dark color-schemes inside ~/.config/bashtop; Press ESC to open the menu and change the theme
# command -v bashtop > /dev/null && alias top='bashtop'
# command -v bpytop > /dev/null && alias top='bpytop'

# --------------------------------- HISTORY ----------------------------------
setopt AUTO_CD
#setopt BEEP
#setopt CORRECT
#setopt HIST_BEEP
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS
setopt MAGIC_EQUAL_SUBST
setopt NO_NO_MATCH
setopt NOTIFY
setopt NUMERIC_GLOB_SORT
setopt PROMPT_SUBST
setopt SHARE_HISTORY

HISTFILE=~/.zsh_history
HIST_STAMPS=mm/dd/yyyy
HISTSIZE=5000
SAVEHIST=5000
ZLE_RPROMPT_INDENT=0
WORDCHARS=${WORDCHARS//\/}
PROMPT_EOL_MARK=
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# --------------------------------- COMPLETIONS ----------------------------------

# ZSH completion system
# Set the path to the .zcompdump file
ZCOMPDUMP_FILE=~/.zcompdump

# Set the interval (in seconds) for updates (24 hours in this example)
UPDATE_INTERVAL=86400

# Check if the file exists
if [ -f "$ZCOMPDUMP_FILE" ]; then
  # Check if the file is older than the specified interval
  if [ $(($(date +%s) - $(date -r "$ZCOMPDUMP_FILE" +%s))) -gt $UPDATE_INTERVAL ]; then
    autoload -Uz +X compinit && compinit -C "$ZCOMPDUMP_FILE"
  else
    compinit -C "$ZCOMPDUMP_FILE"
  fi
else
  # File doesn't exist, autoload compinit and create the file
  autoload -Uz +X compinit && compinit -C "$ZCOMPDUMP_FILE"
fi

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' group-name ''
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ----------------------------------- MISC -----------------------------------
export VISUAL=nano
export EDITOR=$VISUAL

# ------------------------------- ZSH STYLE ---------------------------------

# # ZSH Autosuggestions
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'

# # ZSH Syntax Highlighting
# typeset -gA ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# ZSH_HIGHLIGHT_STYLES[default]=none
# ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
# ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
# ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
# ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
# ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
# ZSH_HIGHLIGHT_STYLES[path]=bold
# ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
# ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
# ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
# ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
# ZSH_HIGHLIGHT_STYLES[command-substitution]=none
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
# ZSH_HIGHLIGHT_STYLES[process-substitution]=none
# ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
# ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
# ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
# ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
# ZSH_HIGHLIGHT_STYLES[assign]=none
# ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
# ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
# ZSH_HIGHLIGHT_STYLES[named-fd]=none
# ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
# ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
# ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
# ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
# ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
# ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
# ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
# ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

# ------------------------------- P10K SETTINGS ---------------------------------

POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_beginning
POWERLEVEL9K_INSTANT_PROMPT=verbose
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_CONTENT} $(whoami | grep -v "^root\$")'
POWERLEVEL9K_OS_ICON_BACKGROUND=red
POWERLEVEL9K_OS_ICON_FOREGROUND=white
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=black
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=red
POWERLEVEL9K_SSH_BACKGROUND=white
POWERLEVEL9K_SSH_FOREGROUND=blue
POWERLEVEL9K_FOLDER_ICON=
POWERLEVEL9K_DIR_BACKGROUND=blue
POWERLEVEL9K_DIR_FOREGROUND=black
POWERLEVEL9K_DIR_WRITABLE_BACKGROUND=black
POWERLEVEL9K_DIR_WRITABLE_FOREGROUND=red
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=green
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=white
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=black
POWERLEVEL9K_VCS_UNTRACKED_ICON=●
POWERLEVEL9K_VCS_UNSTAGED_ICON=±
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=↓
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=↑
POWERLEVEL9K_VCS_COMMIT_ICON=$s
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
POWERLEVEL9K_VIRTUALENV_BACKGROUND=yellow
POWERLEVEL9K_EXECUTION_TIME_ICON=$s
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_BACKGROUND=black
POWERLEVEL9K_COMMAND_BACKGROUND_JOBS_FOREGROUND=cyan
POWERLEVEL9K_TIME_ICON=󰥔
POWERLEVEL9K_TIME_FORMAT='%D{%I:%M}'
POWERLEVEL9K_TIME_BACKGROUND=black
POWERLEVEL9K_TIME_FOREGROUND=white
POWERLEVEL9K_RAM_ICON=
POWERLEVEL9K_RAM_FOREGROUND=black
POWERLEVEL9K_RAM_BACKGROUND=yellow
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰%f '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ssh virtualenv dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time ram)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
