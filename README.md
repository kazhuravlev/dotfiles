# Dotfiles Management with Chezmoi

This repository contains my personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

### Installation

0. Install brew

Read the docs: https://docs.brew.sh/Installation

1. Install chezmoi:

```shell
brew install chezmoi
```

2. Initialize chezmoi with this repository:

```shell
chezmoi init https://github.com/kazhuravlev/dotfiles.git
```

3. Preview changes:

```shell
chezmoi diff
```

4. Apply the configuration:

```shell
chezmoi apply
```

## Structure

- `.bashrc` - Bash configuration
- `.config/fish/` - Fish shell configuration
- `.gitconfig` - Git configuration
- `.tmux.conf` - Tmux configuration
- `.alacritty.toml` - Alacritty terminal configuration
- `.config/nvim/` - Neovim configuration
- `.doom.d/` - Doom Emacs configuration
- `.config/karabiner/` - Karabiner keyboard remapping
- `.config/powerline/` - Powerline status line configuration

## Features

### Shell Configuration

- **Fish**: Modern shell with autosuggestions, syntax highlighting, and custom functions
- **Bash**: Fallback shell with git-aware prompt and useful aliases

### Development Tools

- **Git**: Comprehensive aliases and color configuration
- **Tmux**: Mouse support, vim-like navigation, and session persistence
- **Neovim**: Modern text editor configuration
- **Doom Emacs**: Pre-configured Emacs distribution

### Terminal

- **Alacritty**: GPU-accelerated terminal with Gruvbox theme
- **Tmux integration**: Automatic tmux session on terminal launch

### macOS Specific

- **Homebrew**: Automated package installation
- **Karabiner**: Keyboard customization
- **1Password CLI**: Secure secret management

## Customization

### Secrets Management

Sensitive data is managed through 1Password CLI integration:

- GitHub tokens
- Private environment variables

### Package Management

Edit `.chezmoi.toml.tmpl` to customize the list of packages to install.

## Maintenance

### Update dotfiles

```shell
chezmoi update
```

### Add a new file

```shell
chezmoi add ~/.config/newfile
```

### Edit a managed file

```shell
chezmoi edit ~/.config/file
```

### Apply changes after editing

```shell
chezmoi apply
```

### Backup brew installations

```shell
mkdir -p ~/.config/brew
brew bundle dump --file ~/.config/brew/brewfile --force
chezmoi re-add ~/.config/brew/brewfile
```

## To Do

- Import useful configurations from https://github.com/mathiasbynens/dotfiles/blob/main/.macos
