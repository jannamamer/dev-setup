#!/usr/bin/env bash
set -eu

source ./scripts/colors.sh

KEY_PATH="$HOME/.ssh/git_ssh_key"

if git config --global user.name &>/dev/null; then
  echo "✅ Git is already configured..."
else
  read -p "Enter your full name: " full_name
  read -p "Enter your email address: " email

  # Check if GPG key exist for the email
  echo "Generating GPG key for signing..."
  gpg_key_id=$(gpg --list-secret-keys --with-colons "$email" | awk -F: '/^sec/ {print $5}' | head -n1)
  if [ -z "$gpg_key_id" ]; then
    gpg --quick-generate-key "$full_name <$email>" rsa4096 sign 1y
    echo "✅ GPG key generated..."
  else
    echo "✅ GPG key for $email already exist..."
  fi

  # Check if successfully created
  gpg_key_id=$(gpg --list-secret-keys --with-colons "$email" | awk -F: '/^sec/ {print $5}' | head -n1)
  if [ -z "$gpg_key_id" ]; then
    echo "❌ Failed to find GPG key ID for $email"
    exit 1
  fi

  if [ -f "$KEY_PATH" ]; then
    echo "✅ SSH key for git already exist..."
  else
    echo "Generating SSH key for authentication..."
    ssh-keygen -t ed25519 -C "$email" -f "$KEY_PATH"
    echo "✅ SSH key generated..."
  fi

  git config --global user.name "$full_name"
  git config --global user.email "$email"

  git config --global init.defaultBranch main
  git config --global pull.rebase false
  git config --global core.editor "nvim"

  git config --global user.signingkey $gpg_key_id
  git config --global commit.gpgsign true
  git config --global tag.gpgSign true

  echo ""
  bold "📋 Your SSH public key (add this to your Git provider):"
  echo "--------------------------------------------------------"
  cat "$KEY_PATH.pub"
  echo "--------------------------------------------------------"

  echo ""
  bold "📋 Your GPG public key (add this to your Git provider):"
  echo "--------------------------------------------------------"
  gpg --armor --export "$email"
  echo "--------------------------------------------------------"

  echo ""
  bold "📋 Add the following to your ~/.ssh/config if not already present:"
  echo "--------------------------------------------------------"
  echo "
  Host github.com
    HostName github.com
    User git
    IdentityFile $KEY_PATH 
    IdentitiesOnly yes
  "
  echo "--------------------------------------------------------"
fi
