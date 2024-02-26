# User Prompt Config
# ==================
autoload -Uz promptinit
promptinit

# Enable command-subsitution in PS1
setopt PROMPT_SUBST
# Set our custom prompt
NL=$'\n'
PS1='$NL%B%F{cyan}%3~%f%b$NL%B%(?.%F{green}.%F{red})%(!.#.>)%f%b '

setopt histignorealldups sharehistory

# Set global default editor variables to vim
export EDITOR=vim
export VISUAL=vim

# Set global git repo directory variable
export GIT_REPO_DIR="$HOME/gitRepos"
export PICO_SDK_PATH="$GIT_REPO_DIR/pico-sdk"

# Import our custom script directories into the path variable
PATH=$PATH:$HOME/.bin

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY

# Use modern completion system
autoload -Uz compinit
compinit

# Show the exit code of the last command.
print_last_status() print -u2 "[E:$?]"
precmd_functions+=(print_last_status)

# Load the plugin for autosuggestions from local git repo
source ~/gitRepos/zsh-autosuggestions/zsh-autosuggestions.zsh

# Show mode indicators for vi keybindings
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- N --}/(main|viins)/-- I --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Alias Config
# ============
alias src='. ~/.zshrc'
alias :q='exit'
alias :Q='exit'
alias Q='exit'

alias c='clear'

alias shutd='command sudo shutdown now'
alias sx='command startx'

alias dfe='command dotfile-export-config-to-git'
alias dfd='command dotfile-deploy-config'

# ls Aliases
alias la='command file-index-listing-select'
alias lal='command file-index-listing-select | less -R'
alias ll='command file-index-listing-select'
alias lll='command file-index-listing-select | less -R'

# cd Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cdg='cd ~/gitRepos'
alias cdbg='cd ~/gitRepos/bash-config'
alias cdvg='cd ~/gitRepos/vim-config'
alias cdb='cd ~/.bin'
alias cdv='cd ~/.vim'
alias cdeeznuts='echo "lmao gottem"'

alias cdwg='cd /mnt/c/gitRepos/'
alias cddps='cd /mnt/c/gitRepos/monarch-data-prep-studio/'
alias cdmon='cd /mnt/c/gitRepos/monarch-classic/'
alias cdplg='cd /mnt/c/gitRepos/monarch-dataprep/'
alias cdcom='cd /mnt/c/gitRepos/monarch-desktop-common/'

# Vim Aliases
alias v='command vim'
alias vd='command vimdiff'

# Ranger Aliases
alias r='command ranger'
alias sr='command sudo ranger'

# Linux Tool Aliases
alias f='command find'
alias ds='command du -h --max-depth=1 .'
alias to='command touch'

# Tmux Aliases
alias t='command tmux'
alias ta='command tmux attach'
alias tat='command tmux attach -t'
alias tk='command tmux kill-session -t'
alias tl='command tmux ls'
alias tn='command tmux new -s'

# Git Aliases
alias g='command git'
alias ga='command git add'
alias gaa='command git add .'
alias gap='command git add -p'
alias gapa='command git add -p .'
alias gb='command git branch'
alias gba='command git branch -al'
alias gbd='command git branch -D'
alias gbl='command git-branch-index-listing-select'
alias gbll='command git-branch-index-listing-select | less -R'
alias gc='command git commit'
alias gca='command git commit --amend'
alias gcp='command git cherry-pick'
alias gch='command git checkout'
alias gchb='command git checkout -b'
alias gd='command git diff'
alias gds='command git diff --staged'
alias gdt='command git difftool'
alias gf='command git fetch --prune'
alias gh='command git log -p -- '
alias gir='command git rebase -i'
alias gira='command git rebase --abort'
alias gl='command git log'
alias glfp='command git log --first-parent'
alias glg='command git log --graph --oneline --all'
alias gll='command git log --first-parent --pretty="format:%C(dim green) %<(9,trunc)%ar %C(bold magenta)%h %C(bold green)%<(12,trunc)%an %C(bold yellow)%s"'
alias gm='command git merge'
alias gma='command git merge --abort'
alias gmt='command git mergetool'
alias gpl='command git pull'
alias gps='command git push'
alias gpur='command git clean -x -d -f'
alias gr='command git restore'
alias gra='command git restore .'
alias grp='command git restore -p'
alias grs='command git restore --staged'
alias grsa='command git restore --staged .'
alias grsp='command git restore --staged -p'
alias gsh='command git show'
alias gs='command git status'
alias gst='command git stash'
alias gsta='command git stash apply'
alias gstu='command git stash -u'
alias gstd='command git stash drop'
alias gstl='command git stash list'
alias gsts='command git stash show -p'

# fzf Config
# ==========
fzfExampleDir="/usr/share/doc/fzf/examples"
if [[ -d "$fzfExampleDir" ]]; then
    # Hook fzf functionality into zsh
    source "$fzfExampleDir/key-bindings.zsh"
    source "$fzfExampleDir/completion.zsh"
fi

# Set the default command to include all files in the current
# directory, excluding git files.
# (Same as calling "<DEFAULT_COMMAND> | fzf")
export FZF_DEFAULT_COMMAND="find . -not -path '**/.git/*'"

# GPG Config
# ==========
# Added as per the recommendation of the gpg-agent man
# NOTE: This is required for gpgtar to decrypt correctly.
GPG_TTY=$(tty)
export GPG_TTY

# Make sure that vi keybindings are always on
bindkey -v
