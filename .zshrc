# Prompt
eval "$(starship init zsh)"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# QoL
setopt AUTO_CD INTERACTIVE_COMMENTS NO_BEEP

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide
eval "$(zoxide init zsh)"

# Aliases
alias gs="git status"
alias dc="docker compose"
alias ll="ls -la"