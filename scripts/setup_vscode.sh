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

if [[ $TECH_STACK == *"java"* ]]; then
	JAVA_VERSION=$(asdf current java | awk 'NR==2 {print $2}')
	JAVA_PATH="$HOME/.asdf/installs/java/$JAVA_VERSION"

	MERGED_SETTINGS=$(jq --arg path "$JAVA_PATH" --arg version "$JAVA_VERSION" \
		'."jdk.jdkhome" = $path' ./vscode/settings.json)
fi

SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
TMP=$(mktemp)
echo "$MERGED_SETTINGS" >"$TMP"
mv "$TMP" "$SETTINGS"
