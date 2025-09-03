#!/usr/bin/env bash
set -eu

source config.env

echo "Installing Git Platform CLI..."
if [ "$GIT_PLATFORM" = "github" ]; then
    echo "Installing GitHub CLI..."
    brew install gh
    echo "✅ GitHub CLI installed..."
elif [ "$GIT_PLATFORM" = "gitlab" ]; then
    echo "Installing GitLab CLI..."
    brew install glab
    echo "✅ GitLab CLI installed..."
else
  echo "ℹ️ Unsupported Git Platform..."
fi

if [ "$AWS_ENABLED" = "true" ]; then
  echo "Installing AWS packages..."
  brew bundle --file="$PWD/brewfiles/Brewfile.aws"
  echo "✅ AWS packages installed..."
fi

if [ "$DOCKER_ENABLED" = "true" ]; then
  echo "Installing Docker packages..."
  brew bundle --file="$PWD/brewfiles/Brewfile.docker"
  echo "✅ Docker packages installed..."
fi

if [ "$KUBERNETES_ENABLED" = "true" ]; then
  echo "Installing Kubernetes packages..."
  brew bundle --file="$PWD/brewfiles/Brewfile.kube"
  echo "✅ Kubernetes packages installed..."
fi