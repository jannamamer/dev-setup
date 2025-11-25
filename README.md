# Dev Environment Setup

This repository provides scripts and configuration files to quickly set up a development environment on macOS and Linux using Homebrew, Zsh, Neovim, and various language tooling.

## Overview

This setup automates installing and configuring:

- Homebrew packages based on predefined Brewfiles
- Zsh shell with custom themes and aliases
- Neovim with custom settings and plugins
- Language-specific tooling and development services

All configuration is driven by environment variables in [config.env](./config.env).

## Supported Tech Stack & Tools

Configuration for languages, services, formatters, linters, and parsers is defined in [config.env](./config.env). Update this file to customize your setup.

### Configuration Summary

#### 1. High-Level Features / Tools

| Feature / Service | Env Variable         | Example |
| ----------------- | -------------------- | ------- |
| VIM Tools         | `VIM_TOOLS`          | true    |
| VS Code Tools     | `VSCODE_TOOLS`       | true    |
| AWS Tools         | `AWS_ENABLED`        | true    |
| Docker Tools      | `DOCKER_ENABLED`     | true    |
| Kubernetes Tools  | `KUBERNETES_ENABLED` | false   |

#### 2. Tech Stack & Git

| Feature / Service | Env Variable   | Example               | Accepted Values                                   |
| ----------------- | -------------- | --------------------- | ------------------------------------------------- |
| Tech Stack        | `TECH_STACK`   | python,ruby,terraform | dotnet, elixir, go, java, python, ruby, terraform |
| Git Platform      | `GIT_PLATFORM` | github                | github, gitlab                                    |

#### 3. Databases & Files

| Feature / Service  | Env Variable             | Example             | Accepted Values              |
| ------------------ | ------------------------ | ------------------- | ---------------------------- |
| Databases          | `DATABASES`              | postgres            | postgres, mysql              |
| Special Files      | `SPECIAL_FILES`          | Makefile,README.md  | Comma-separated filenames    |
| Ignore Directories | `DEPENDENCY_DIRECTORIES` | node_modules,vendor | Comma-separated folder names |

#### 4. Vim Formatters & Linters (optional)

| Feature / Service   | Env Variable                | Example                       | Accepted Values / Reference                                                                   |
| ------------------- | --------------------------- | ----------------------------- | --------------------------------------------------------------------------------------------- |
| Vim Base Parsers    | `VIM_PARSERS`               | bash,json,markdown            | See [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages) |
| Vim Base Formatters | `VIM_FORMATTERS`            | bash=shfmt,lua=stylua         | See [conform.nvim](https://github.com/stevearc/conform.nvim#formatters)                       |
| Vim Base Linters    | `VIM_LINTERS`               | bash=shellcheck,yaml=yamllint | See [nvim-lint](https://github.com/mfussenegger/nvim-lint#available-linters)                  |
| Vim Formatters      | `VIM_<LANGUAGE>_FORMATTERS` | bash=shfmt,lua=stylua         | See [conform.nvim](https://github.com/stevearc/conform.nvim) supported formatters             |
| Vim Linters         | `VIM_<LANGUAGE>_LINTERS`    | bash=shellcheck,yaml=yamllint | See [nvim-lint](https://github.com/mfussenegger/nvim-lint) supported linters                  |

> Notes: Replace `<LANGUAGE>` with DOTNET, ELIXIR, GO, JAVA, PYTHON, RUBY, TERRAFORM, DOCKER.

#### 5. VS Code Extensions (optional)

| Feature / Service                             | Env Variable                   | Example                             |
| --------------------------------------------- | ------------------------------ | ----------------------------------- |
| Base Extensions                               | `VSCODE_EXTENSIONS`            | davidanson.vscode-markdownlint      |
| AWS / Azure / Docker / Kubernetes / Terraform | `VSCODE_<SERVICE>_EXTENSIONS`  | ms-azuretools.vscode-containers     |
| Language Extensions                           | `VSCODE_<LANGUAGE>_EXTENSIONS` | ms-python.python,charliermarsh.ruff |

> Notes: Replace `<SERVICE>` with AWS, AZURE, DOCKER, KUBERNETES, TERRAFORM and `<LANGUAGE>` with DOTNET, ELIXIR, GO, JAVA, PYTHON, RUBY.

#### 6. Notes

- `config.env` only needs **high-level toggles** and any values you want to override.
- All other defaults are defined in code for simplicity, but can be overridden by setting the corresponding environment variables.

## Usage

1. Download the repository:

   ```bash
   curl -L https://github.com/jannamamer/dev-setup.git -o dev-setup.zip
   unzip dev-setup.zip
   cd dev-setup
   ```

2. Configure your stack and tools by updating [config.env](./config.env) to reflect your desired tech stack and services.

3. Run the main script:

   ```bash
   ./install.sh
   ```

## Neovim Keybindings

- The `<leader>` key is set to `Space`
- Press `Space/` to vies all available keybindings

## Notes & Limitations

- Brewfiles must be predefined for each tech stack you want to support
- Only tools explicitly listed in config.env will be installed
- Windows is currently not supported
