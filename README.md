# Managing vim

Deploy
```
cd ~
git clone https://github.com/epage/vimfiles.git .vim
copy .vim/extra/.vimrc ~/
copy .vim/extra/.gitcnfig ~/
```
Note: be sure to set the email address in `.gitconfig`.

Add
```
cd ~/.vim/bundle
git submodule add REPO
```

Update
```
cd ~/.vim
git submodule foreach git pull
git add bundle
```

# Machine setup

## Windows, elevated

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install elevate

## Windows, non-elevated

elevate choco install git
elevate choco install 7zip
elevate choco install ripgrep
elevate choco install steam
elevate choco install vim
elevate choco install ConEmu

## Linux

sudo apt-get update
sudo apt-get upgrade
sudo apt-get build-essetial pkg-config libssl-dev cmake
curl https://sh.rustup.rs -sSf | sh
source ~/.cargo/env
cargo install ripgrep


## Regular prompt

rustup install beta
rustup install nightly
rustup run nightly cargo install clippy
cargo install rustfmt --ver 0.8.6
cargo install fd-find
cargo install cargo-tree
cargo-install cargo-outdated
