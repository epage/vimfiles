#!/usr/bin/env python3

import argparse
import json
import json
import logging
import multiprocessing.dummy
import pathlib
import subprocess


REPOS = pathlib.Path(__file__).parent / "repos.json"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=pathlib.Path, default="~/src/personal")
    args = parser.parse_args()

    log_format = '(%(relativeCreated)5d) %(levelname)-5s %(name)s.%(funcName)s: %(message)s'
    logging.basicConfig(level=logging.DEBUG, format=log_format)

    raw = json.loads(REPOS.read_text())
    pool = multiprocessing.dummy.Pool()
    pool.map(raw.values(), lambda repo: prepare_repo(args.root, repo)):
    pool.close()
    pool.join()


def prepare_repo(root, repo):
    logging.debug("Processing %s", dir.name)
    repo_root = root / repo["name"]
    subprocess.run(["git", "clone", repo["remotes"]["origin"], repo_root], encoding="utf-8", capture_output=True, check=True)
    for remote_name, remote_url in repo["remotes"].items():
        if remote_name == "origin":
            continue
        subprocess.run(["git", "-C", repo_root, "remote", "add", remote_name, remote_url], encoding="utf-8", capture_output=True, check=True)
        if remote_url == "upstream":
            subprocess.run(["git", "-C", repo_root, "pull", remote_name], encoding="utf-8", capture_output=True, check=True)

    hook = repo_root / ".pre-commit-config.yaml"
    if hook.exists():
        subprocess.run(["pre-commit", "install", "-t", "pre-commit", "-t", "commit-msg"], capture_output=True, check=True)


if __name__ == "__main__":
    main()
