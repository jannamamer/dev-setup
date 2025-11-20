#!/usr/bin/env bash

set -eu

source config.env

install_brew() {
  echo "Installing $1 packages..."
  brew bundle --file="$PWD/brewfiles/Brewfile.$1"
  echo "✅ $1 packages installed..." && echo
}

install_asdf() {
  echo "Installing $1..."
  asdf plugin add "$1"
  latest=$(asdf list all "$1" | grep -E '^[0-9]+(\.[0-9]+){0,2}$' | tail -1)
  asdf install "$1" "$latest"
  asdf set --home "$1" "$latest"
  echo "✅ $1 installed..." && echo
}

install_brew "$GIT_PLATFORM"
[ "$AWS_ENABLED" = "true" ] && install_brew "aws"
[ "$AZURE_ENABLED" = "true" ] && install_brew "azure"
[ "$DOCKER_ENABLED" = "true" ] && install_brew "docker"
[ "$KUBERNETES_ENABLED" = "true" ] && install_brew "kubernetes"

IFS=','
read -ra tech_stack <<<"$TECH_STACK"
for stack in "${tech_stack[@]}"; do
  [ "$stack" = "go" ] && stack="golang"

  install_asdf "$stack"
  install_brew "$stack"
done

if [[ $TECH_STACK == *"ruby"* ]]; then
  echo "Installing ruby packages via gem..."
  gem install brakeman bundler-audit htmlbeautifier reek rubocop
  echo "✅ ruby packages installed via gem..." && echo
fi

if [[ $TECH_STACK == *"dotnet"* ]]; then
  echo "Installing dotnet packages..."
  dotnet tool install csharpier -g
  echo "✅ dotnet packages installed..." && echo
fi

read -ra databases <<<"$DATABASES"
for db in "${databases[@]}"; do
  install_brew "$db"
  install_asdf "$db"
done
