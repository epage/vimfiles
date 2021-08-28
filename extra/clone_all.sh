#!/usr/bin/env bash

set -eux

mkdir -p ~/src/personal
pushd ~/src/personal

git clone git@github.com:epage/assert_cmd.git
pushd assert_cmd
git remote add upstream git@github.com:assert-rs/assert_cmd.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/assert_fs.git
pushd assert_fs
git remote add upstream git@github.com:assert-rs/assert_fs.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/cargo-release.git
pushd cargo-release
git remote add upstream git@github.com:sunng87/cargo-release.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/clap-cargo.git
pushd clap-cargo
git remote add upstream git@github.com:crate-ci/clap-cargo.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/cobalt.rs.git
pushd cobalt.rs
git remote add upstream git@github.com:cobalt-org/cobalt.rs.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/codegenrs.git
pushd codegenrs
git remote add upstream git@github.com:crate-ci/codegenrs.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/committed.git
pushd committed
git remote add upstream git@github.com:crate-ci/committed.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/epage.github.io.git
pushd epage.github.io
popd

git clone git@github.com:epage/escargot.git
pushd escargot
git remote add upstream git@github.com:crate-ci/escargot.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/git-conventional.git
pushd git-conventional
git remote add upstream git@github.com:crate-ci/git-conventional.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/imperative.git
pushd imperative
git remote add upstream git@github.com:crate-ci/imperative.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/kstring.git
pushd kstring
git remote add upstream git@github.com:cobalt-org/kstring.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/liquid-rust.git
pushd liquid-rust
git remote add upstream git@github.com:cobalt-org/liquid-rust.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/predicates-rs.git
pushd predicates-rs
git remote add upstream git@github.com:assert-rs/predicates-rs.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/proc-exit.git
pushd proc-exit
git remote add upstream git@github.com:assert-rs/proc-exit.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/ripgrep.git
pushd ripgrep
git remote add upstream git@github.com:BurntSushi/ripgrep.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/typos.git
pushd typos
git remote add upstream git@github.com:crate-ci/typos.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/unicode-xid.git
pushd unicode-xid
git remote add upstream git@github.com:unicode-rs/unicode-xid.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/yansi.git
pushd yansi
git remote add upstream git@github.com:SergioBenitez/yansi.git
git fetch upstream
git reset --hard upstream/master
popd

git clone git@github.com:epage/gtr.git
pushd gtr
git fetch
git checkout manual
git checkout automated
popd
