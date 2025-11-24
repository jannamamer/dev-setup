#!/usr/bin/env bash

install_extensions() {
	IFS=','
	read -ra extensions <<<"$1"
	for extension in "${extensions[@]}"; do
		echo "Installing $extension extension..."
		code --install-extension "$extension"
		echo "✅ $extension extension installed..." && echo
	done
}

install_extensions "$VSCODE_EXTENSIONS"
[ "$AWS_ENABLED" = "true" ] && install_extensions "$VSCODE_AWS_EXTENSIONS"
[ "$AZURE_ENABLED" = "true" ] && install_extensions "$VSCODE_AZURE_EXTENSIONS"
[ "$DOCKER_ENABLED" = "true" ] && install_extensions "$VSCODE_DOCKER_EXTENSIONS"
[ "$KUBERNETES_ENABLED" = "true" ] && install_extensions "$VSCODE_KUBERNETES_EXTENSIONS"

IFS=','
read -ra tech_stack <<<"$TECH_STACK"
for stack in "${tech_stack[@]}"; do
	var_name="VSCODE_$(echo "$stack" | tr '[:lower:]' '[:upper:]')_EXTENSIONS"
	install_extensions "${!var_name}"
done
