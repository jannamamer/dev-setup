#!/usr/bin/env bash

VSCODE_EXTENSIONS='mechatroner.rainbow-csv,htmlhint.vscode-htmlhint,dbaeumer.vscode-eslint,redhat.vscode-yaml,stylelint.vscode-stylelint,timonwong.shellcheck,esbenp.prettier-vscode,mkhl.shfmt'
VSCODE_AWS_EXTENSIONS='localstack.localstack'
VSCODE_AZURE_EXTENSIONS='ms-azuretools.vscode-bicep,ms-vscode.powershell,ms-azure-devops.azure-pipelines,ms-vscode.azurecli'
VSCODE_DOCKER_EXTENSIONS='ms-azuretools.vscode-containers,docker.docker'
VSCODE_KUBERNETES_EXTENSIONS='ms-kubernetes-tools.vscode-kubernetes-tools'

VSCODE_DOTNET_EXTENSIONS='ms-dotnettools.csdevkit,ms-dotnettools.csharp'
VSCODE_ELIXIR_EXTENSIONS='jakebecker.elixir-ls'
VSCODE_GO_EXTENSIONS='golang.go'
VSCODE_JAVA_EXTENSIONS='oracle.oracle-java'
VSCODE_PYTHON_EXTENSIONS='ms-python.python,charliermarsh.ruff,ms-python.black-formatter,ms-python.isort,ms-python.mypy-type-checker,ms-python.vscode-pylance,ms-python.flake8'
VSCODE_TERRAFORM_EXTENSIONS='hashicorp.terraform'

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
