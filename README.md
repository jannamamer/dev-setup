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

| Feature / Service        | Env Variable             | Example Value                               | Accepted Values                                                                                                                             |
| ------------------------ | ------------------------ | ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tech Stack**           | `TECH_STACK`             | `python,ruby,terraform`                     | `elixir`, `go`, `python`, `ruby`, `terraform`                                                                                               |
| **AWS Tools**            | `AWS_ENABLED`            | `true`                                      | `true`, `false`                                                                                                                             |
| **Docker Tools**         | `DOCKER_ENABLED`         | `true`                                      | `true`, `false`                                                                                                                             |
| **Kubernetes Tools**     | `KUBERNETES_ENABLED`     | `false`                                     | `true`, `false`                                                                                                                             |
| **Git Platform**         | `GIT_PLATFORM`           | `github`                                    | `github`, `gitlab`                                                                                                                          |
| **Databases**            | `DATABASES`              | `postgres`                                  | `postgres`, `mysql`                                                                                                                         |
| **Special Files**        | `SPECIAL_FILES`          | `Makefile,README.md`                        | Comma-separated list of filenames                                                                                                           |
| **Ignore Directories**   | `DEPENDENCY_DIRECTORIES` | `node_modules,vendor`                       | Comma-separated list of folder names                                                                                                        |
| **General Parsers**      | `GENERAL_PARSERS`        | `bash,json,markdown`                        | Must match [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages) supported languages |
| **General Formatters**   | `GENERAL_FORMATTERS`     | `bash=shfmt, lua=stylua`                    | Must match [conform.nvim](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters) supported formatters                      |
| **General Linters**      | `GENERAL_LINTERS`        | `bash=shellcheck, yaml=yamllint`            | Must match [nvim-lint](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters) supported linters                    |
| **Elixir Formatters**    | `ELIXIR_FORMATTERS`      | `elixir=mix,heex=mix`                       | Must match [conform.nvim](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters) supported formatters for Elixir           |
| **Elixir Linters**       | `ELIXIR_LINTERS`         | `elixir=credo`                              | Must match [nvim-lint](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters) supported linters for Elixir         |
| **Go Formatters**        | `GO_FORMATTERS`          | `go=gofmt goimports`                        | Must match [conform.nvim](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters) supported formatters for Go               |
| **Go Linters**           | `GO_LINTERS`             | `go=golangcilint`                           | Must match [nvim-lint](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters) supported linters for Go             |
| **Python Formatters**    | `PYTHON_FORMATTERS`      | `python=black isort`                        | Must match [conform.nvim](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters) supported formatters for Python           |
| **Python Linters**       | `PYTHON_LINTERS`         | `python=bandit mypy ruff`                   | Must match [nvim-lint](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters) supported linters for Python         |
| **Ruby Formatters**      | `RUBY_FORMATTERS`        | `ruby=rubocop,eruby=htmlbeautifier rubocop` | Must match [conform.nvim](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters) supported formatters for Ruby             |
| **Ruby Linters**         | `RUBY_LINTERS`           | `ruby=brakeman reek rubocop`                | Must match [nvim-lint](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters) supported linters for Ruby           |
| **Terraform Formatters** | `TERRAFORM_FORMATTERS`   | `hcl=hcl,terraform=terraform_fmt`           | Must match [conform.nvim](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters) supported formatters for Terraform        |
| **Terraform Linters**    | `TERRAFORM_LINTERS`      | `hcl=tflint,terraform=tflint tfsec`         | Must match [nvim-lint](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters) supported linters for Terraform      |
| **Docker Formatters**    | `DOCKERFILE_FORMATTERS`  | ``                                          | Must match [conform.nvim](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters) supported formatters for Docker           |
| **Docker Linters**       | `DOCKERFILE_LINTERS`     | `dockerfile=hadolint`                       | Must match [nvim-lint](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters) supported linters for Docker         |

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
