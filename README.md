Personal nix dotfiles containing system configuration, editor, etc...

# NixOS Configurations
## Hardtack (wsl)
### Usage
```sh
# Create config
mkdir -p ~/.config/dotfiles-config
cd ~/.config/dotfiles-config
nix flake init -t github.com:KeatonClark/dotfiles#dotfiles-config
# Modify values in flake.nix

# Installation
nixos-rebuild switch --flake github:KeatonClark/dotfiles#hardtack --override-input dotfiles-config path:~/.config/dotfiles-config
```
### Features
- tmux config
- mariner (neovim)
- ollama service with nvidia pass through
- zsh config

# Packages
## Mariner (neovim)
### Usage
```sh 
# Running
nix run github:KeatonClark/dotfiles#mariner

# Profile install
nix profile add github:KeatonClark/dotfiles#mariner

# Upgrading
nix profile upgrade mariner
```
### Features
#### Completion
- c/c++
- bash
- cmake
- docker
- lua
- rust
- md
- tex
- python
- other:
    - snippets
    - spell check
    - tmux session
    - buffers
#### Git
- summary (<space\>go)
- pull (<space\>gu)
- push (<space\>gp)
- hunk add (<space\>gha)
- hunk reset (<space\>ghr)
- file add (<space\>gaf)
- file reset (<space\>gar)
- commit (<space\>gc)
#### Searching
- file (<space\>ff)
- string (<space\>fs)
- word under cursor (<space\>fw)
- buffer (<space\>fb)
- jumplist (<space\>fj)
- marks (<space\>fm)

# Templates
## Rust
flake template for cross compiling rust for windows and musl
### Setup 
```sh
# flake init
nix flake init -t github:KeatonClark/dotfiles#rust

# devshell
nix develop

# cargo init
cargo init
# or
cargo init --lib
```

