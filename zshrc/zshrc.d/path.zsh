# User-local binaries and scripts
export PATH="$HOME/.local/bin:$PATH"

# Homebrew binaries (if available)
if command -v brew >/dev/null 2>&1; then
  export BREW_PREFIX="$(brew --prefix)"
  export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH"
fi

# System sbin directories (for admin/system tools)
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
