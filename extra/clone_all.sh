#!/usr/bin/env bash

set -eux

git clone https://github.com/epage/assert_cmd.git
pushd assert_cmd
git remote add upstream https://github.com/assert-rs/assert_cmd.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/assert_fs.git
pushd assert_fs
git remote add upstream https://github.com/assert-rs/assert_fs.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/cargo-release.git
pushd cargo-release
git remote add upstream https://github.com/sunng87/cargo-release.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/clap-cargo.git
pushd clap-cargo
git remote add upstream https://github.com/crate-ci/clap-cargo.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/cobalt.rs.git
pushd cobalt.rs
git remote add upstream https://github.com/cobalt-org/cobalt.rs.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/codegenrs.git
pushd codegenrs
git remote add upstream https://github.com/crate-ci/codegenrs.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/committed.git
pushd committed
git remote add upstream https://github.com/crate-ci/committed.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/epage.github.io.git
pushd epage.github.io
popd

git clone https://github.com/epage/escargot.git
pushd escargot
git remote add upstream https://github.com/crate-ci/escargot.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/cargo-release-test.git

git clone https://github.com/epage/git-conventional.git
pushd git-conventional
git remote add upstream https://github.com/crate-ci/git-conventional.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/imperative.git
pushd imperative
git remote add upstream https://github.com/crate-ci/imperative.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/kstring.git
pushd kstring
git remote add upstream https://github.com/cobalt-org/kstring.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/liquid-rust.git
pushd liquid-rust
git remote add upstream https://github.com/cobalt-org/liquid-rust.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/predicates-rs.git
pushd predicates-rs
git remote add upstream https://github.com/assert-rs/predicates-rs.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/proc-exit.git
pushd proc-exit
git remote add upstream https://github.com/assert-rs/proc-exit.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/ripgrep.git
pushd ripgrep
git remote add upstream https://github.com/BurntSushi/ripgrep.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/typos.git
pushd typos
git remote add upstream https://github.com/crate-ci/typos.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/unicode-xid.git
pushd unicode-xid
git remote add upstream https://github.com/unicode-rs/unicode-xid.git
git pull --rebase upstream master
popd

git clone https://github.com/epage/yansi.git
pushd yansi
git remote add upstream https://github.com/SergioBenitez/yansi.git
git pull --rebase upstream master
popd
