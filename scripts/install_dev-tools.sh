#!/usr/bin/env bash
set -eu

source config.env

if [ "$GIT_PLATFORM" = "github" ]; then
  echo "Installing GitHub CLI..."
  brew install gh
  echo "✅ GitHub CLI installed..." && echo
elif [ "$GIT_PLATFORM" = "gitlab" ]; then
  echo "Installing GitLab CLI..."
  brew install glab
  echo "✅ GitLab CLI installed..." && echo
else
  echo "ℹ️ Unsupported Git Platform..." && echo
fi

if [ "$AWS_ENABLED" = "true" ]; then
  echo "Installing AWS packages..."
  brew bundle --file="$PWD/brewfiles/Brewfile.aws"
  echo "✅ AWS packages installed..." && echo
fi

if [ "$DOCKER_ENABLED" = "true" ]; then
  echo "Installing Docker packages..."
  brew bundle --file="$PWD/brewfiles/Brewfile.docker"
  echo "✅ Docker packages installed..." && echo
fi

if [ "$KUBERNETES_ENABLED" = "true" ]; then
  echo "Installing Kubernetes packages..."
  brew bundle --file="$PWD/brewfiles/Brewfile.kube"
  echo "✅ Kubernetes packages installed..." && echo
fi

IFS=','
read -ra tech_stack <<<"$TECH_STACK"
for stack in "${tech_stack[@]}"; do
  echo "Installing $stack packages..."
  # brew bundle --file="$PWD/brewfiles/Brewfile.$stack"
  echo "✅ $stack packages installed..." && echo
done
