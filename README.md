# Managing vim

Setup [SSH keys with github](https://stackoverflow.com/questions/2643502/how-to-solve-permission-denied-publickey-error-when-using-git).

Setup [ssh-agent](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows) if needed

Deploy
```bash
cd ~
git clone git@github.com:epage/vimfiles.git .vim
cp .vim/extra/.vimrc ~/
cp .vim/extra/.tmux.conf ~/
mkdir -p ~/.config ~/.local/bin
cp -r .vim/extra/config/* ~/.config/
cp -r .vim/extra/bin/* ~/.local/bin
```
Note: be sure to set the email address in `.config/git/config`.

- Initialize plugins: `:PlugInstall`
- Update plugins: `:PlugUpdate`
- Cleanup removed plugins: `:PlugClean`

# Machine setup

## Linux

### Debian-derived

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential pkg-config libssl-dev cmake curl unzip
sudo apt install ripgrep
```

### Manjaro

```bash
sudo pamac install pkgconf make cmake gcc
sudo pamac install ripgrep
sudo pamac install tmux
sudo pamac install pkgfile
```

Add to `.bashrc`
```bash
source /usr/share/doc/pkgfile/command-not-found.bash
```

### General

```bash
curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal
source ~/.cargo/env

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts && rm FiraCode.zip
fc-cache -f -v
curl -fsSL https://starship.rs/install.sh | sh -s -- -b ~/.local/bin
```

Install
- https://github.com/zellij-org/zellij/releases
- https://github.com/neovim/neovim/releases
- https://github.com/cli/cli/blob/trunk/docs/install_linux.md

Add to `.bashrc`

```bash
export MANPAGER="vim -M +MANPAGER -"

export EDITOR=vim

export PATH=$PATH:$HOME/bin

export BAT_THEME=OneHalfLight

source <(jj util completion bash)

source <(CARGO_COMPLETE=bash nargo)

eval "$(starship init bash)"

# For WSL
# export DISPLAY=:0
# /usr/bin/keychain -q --nogui $HOME/.ssh/id_github
# source $HOME/.keychain/$HOSTNAME-sh
```

## Mac

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install bash
brew install git bash-completion
brew install macvim neovim ripgrep fd zellij
brew cask install diffmerge firefox iterm2 dropbox sweet-home3d

curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal
source ~/.cargo/env
```

Add to `.bash_profile`

```bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

export MANPAGER="vim -M +MANPAGER -"

export EDITOR=vim
```

## Windows, elevated

```bash
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install elevate -y
```

## Windows, non-elevated

```bash
el choco install git -y
el choco install 7zip -y
el choco install ripgrep -y
el choco install steam -y
el choco install vim -y
el choco install vcxsrv -y
el choco install winmerge -y
```

## Regular prompt

```bash
rustup install beta nightly
rustup component add rustfmt clippy
cargo install bacon
cargo install bat
cargo install broot
cargo install ddh
cargo install fd-find
cargo install hexyl
cargo install hyperfine
cargo install mdbook
cargo install rumdl
cargo install tokei
cargo install zola
cargo install cargo-bloat
cargo install cargo-expand
cargo install cargo-hack
cargo install cargo-llvm-lines
cargo install cargo-outdated
cargo install cargo-show-asm
cargo install --git https://github.com/rust-lang/measureme crox flamegraph summarize
```
