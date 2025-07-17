Personal nix dotfiles containing system configuration, editor, etc...

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
