# User-local binaries and scripts
export LOCAL_BIN="$HOME/.local/bin"
export ASDF_BIN="$HOME/.local/asdf/bin"
export PATH="$LOCAL_BIN:$ASDF_BIN:$PATH"

# Homebrew binaries (if available)
if command -v brew >/dev/null 2>&1; then
  export BREW_BIN="$(brew --prefix)/bin"
  export PATH="$BREW_BIN:$PATH"
fi

# System sbin directories (for admin/system tools)
export SYSTEM_SBINS="/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH:$SYSTEM_SBINS"
