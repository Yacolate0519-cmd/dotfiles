# Powerlevel10k instant prompt → speeds up shell startup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# GO Compiler PATH
export PATH="$HOME/go/bin/:$PATH"

# Homebrew setup → add brew path and set auto-update interval (1 day)
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_AUTO_UPDATE_SECS=86400

# Claude Code 
export PATH="$HOME/.local/bin:$PATH"

# Python alias → run python when typing python3
alias python="python3"
alias pip="pip3"

# LazyGit alias -> run lazygit when typing lg
alias lg="lazygit"

# oh-my-zsh setup → path, theme, plugins, and core initialization
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Lazy-load conda environment keep zsh working fast-start
conda() {
  unset -f conda
  source /opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh
  conda "$@"
}

# Powerlevel10k user config → load .p10k.zsh if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Tmux auto-start
# Only ayto-attach tmux in real terminal, NOT inside VSCode
if [[ $- == *i* ]] \
   && [ -z "$TMUX" ] \
   && [ "$TERM_PROGRAM" != "vscode" ] \
   && command -v tmux &>/dev/null; then
  tmux attach-session -t default || tmux new-session -s default
  exit
fi



# Added by Antigravity
export PATH="/Users/yacolate0519/.antigravity/antigravity/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/yacolate0519/.lmstudio/bin"
# End of LM Studio CLI section


# bun completions
[ -s "/Users/yacolate0519/.bun/_bun" ] && source "/Users/yacolate0519/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
