# Managing vim

Setup [SSH keys with github](https://stackoverflow.com/questions/2643502/how-to-solve-permission-denied-publickey-error-when-using-git).

Setup [ssh-agent](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows) if needed

Deploy
```bash
cd ~
git clone git@github.com:epage/vimfiles.git .vim
cp .vim/extra/.vimrc ~/
cp .vim/extra/.tmux.conf ~/
mkdir -p ~/.config ~/bin
cp -r .vim/extra/config/* ~/.config/
cp -r .vim/extra/bin/* ~/bin
```
Note: be sure to set the email address in `.config/git/config`.

- Initialize plugins: `:PlugInstall`
- Update plugins: `:PlugUpdate`
- Cleanup removed plugins: `:PlugClean`

# Machine setup

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

## Linux

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

### Mint

```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential pkg-config libssl-dev cmake curl unzip
sudo apt install universal-ctags
sudo apt install ripgrep
sudo apt install tmux
```

### General

```bash
curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal
source ~/.cargo/env
rustup component add rustfmt clippy
rustup toolchain install beta nightly

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts && rm FiraCode.zip
fc-cache -f -v
curl -fsSL https://starship.rs/install.sh | sh -s -- -b ~/bin
```

Add to `.bashrc`

```bash
export MANPAGER="vim -M +MANPAGER -"

export EDITOR=vim

export PATH=$PATH:$HOME/bin

eval "$(starship init bash)"

# For WSL
# export DISPLAY=:0
# /usr/bin/keychain -q --nogui $HOME/.ssh/id_github
# source $HOME/.keychain/$HOSTNAME-sh
```

## Mac

```bash
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2
brew install git bash-completion
brew install macvim
brew install ripgrep
brew install fd
brew install exa
brew install ctags
brew install tmux
brew install flake8
brew install shfmt
brew install python@3.8
brew cask install diffmerge firefox iterm2 dropbox sweet-home3d

mkdir ~/.bash
cd .bash
git clone git://github.com/jimeh/git-aware-prompt.git

curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal
source ~/.cargo/env
rustup component add rustfmt
rustup component add clippy
rustup toolchain install beta
rustup toolchain install nightly
```

Add to `.bash_profile`

```bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

export MANPAGER="vim -M +MANPAGER -"

export EDITOR=vim
```

## Regular prompt

```bash
rustup install beta
rustup install nightly
rustup component add clippy
rustup component add rustfmt
cargo install fd-find
cargo install bat
cargo install broot
cargo install ddh
cargo install exa
cargo install hyperfine
cargo install tokei
cargo install cargo-tree
cargo install cargo-outdated
cargo install cargo-llvm-lines
cargo install cargo-asm
cargo install cargo-expand
cargo install cargo-bloat
cargo install --git https://github.com/rust-lang/measureme crox flamegraph summarize
```
