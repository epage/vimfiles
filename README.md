# Managing vim

Deploy
```bash
cd ~
git clone --recursive https://github.com/epage/vimfiles.git .vim
cp .vim/extra/.vimrc ~/
cp .vim/extra/.gitconfig ~/
```
Note: be sure to set the email address in `.gitconfig`.

Add
```bash
cd ~/.vim/bundle
git submodule add REPO
```

Update
```bash
cd ~/.vim
git submodule foreach git pull origin master
git add bundle

# Or is it
git submodule update --recursive
```

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
el choco install ConEmu -y
el choco install vcxsrv -y
el choco install winmerge -y
rem For Work
el choco install insted -y
el choco install p4v -y
```

## Linux

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get build-essential pkg-config libssl-dev cmake curl
curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal
source ~/.cargo/env
cargo install ripgrep
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
brew cask install diffmerge

mkdir ~/.bash
cd .bash
git clone git://github.com/jimeh/git-aware-prompt.git

curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal
source ~/.cargo/env
```

Add to `.bash_profile` for local system

```bash
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/colors.sh"
source /usr/local/etc/bash_completion.d/git-prompt.sh
export PS1="\w \[\$txtcyn\]\$(__git_ps1 '[%s]')\[\$txtrst\] \$ "

export EDITOR=vim
```

and for remote systems

```bash
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/colors.sh"
export PS1="\[\$txtblu\]\u@\h\[\$txtrst\] \w \$ "

export EDITOR=vim
```

## Regular prompt

```bash
rustup install beta
rustup install nightly
rustup component add clippy
rustup component add rustfmt
cargo install fd-find
cargo install cargo-tree
cargo-install cargo-outdated
cargo install cargo-llvm-lines
cargo install cargo-release
```
