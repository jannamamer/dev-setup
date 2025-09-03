export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="pygmalion"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Source modular configs
for config in ~/.zshrc.d/*.zsh; do
  source "$config"
done

# Initialize asdf (installed via Homebrew)
if [ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]; then
  . "$(brew --prefix asdf)/libexec/asdf.sh"
fi

# Adds a custom function directory to the autoload path
fpath+=${ZDOTDIR:-$HOME}/.zsh_functions

#	Enables tab-completion in Zsh
autoload -Uz compinit && compinit

# Disables asynchronous prompt updates for Git
zstyle ':omz:alpha:lib:git' async-prompt no

# Set default editor
# export VISUAL=code
# export EDITOR="$VISUAL"
