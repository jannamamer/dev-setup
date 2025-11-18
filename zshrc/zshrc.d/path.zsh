# User-local binaries and scripts
export PATH="$HOME/.local/bin:$PATH"

# Homebrew binaries (if available)
if command -v brew >/dev/null 2>&1; then
  export BREW_PREFIX="$(brew --prefix)"
  export PATH="$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH"

  # Postgres setup
  export OPENSSL_DIR=$(brew --prefix openssl@3)
  export LDFLAGS="-L$OPENSSL_DIR/lib"
  export CPPFLAG="-I$OPENSSL_DIR/include"
  export PKG_CONFIG_PATH="$OPENSSL_DIR/lib/pkgconfig"
  export POSTGRES_CONFIGURE_OPTIONS="--with-uuid=e2fs --with-openssl --with-libraries=$OPENSSL_DIR/lib --with-includes=$OPENSSL_DIR/include"

  export PATH="$BREW_PREFIX/opt/icu4c/bin:$PATH"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$BREW_PREFIX/opt/icu4c/lib/pkgconfig"
fi

# System sbin directories (for admin/system tools)
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
