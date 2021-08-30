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

    try:
        raw = json.loads(REPOS.read_text())
    except FileNotFoundError:
        raw = {}

    root = args.root.expanduser()
    pool = multiprocessing.dummy.Pool()
    for dir_data in pool.imap(repo_data, root.iterdir()):
        if not dir_data:
            continue
        raw[dir_data["name"]] = dir_data
    pool.close()
    pool.join()

    REPOS.write_text(json.dumps(raw, sort_keys=True, indent=4))


def repo_data(dir):
    if not dir.joinpath(".git").exists():
        return {}
    logging.debug("Processing %s", dir.name)
    data = {
        "name": dir.name,
        "remotes": {
            name: fetch_url(dir, name)
            for name in list_remotes(dir)
        }
    }
    return data


def list_remotes(dir):
    p = subprocess.run(["git", "-C", dir, "remote", "show"], encoding="utf-8", capture_output=True, check=True)
    return [l.strip() for l in p.stdout.splitlines() if l.strip()]


def fetch_url(dir, remote):
    p = subprocess.run(["git", "-C", dir, "remote", "show", remote], encoding="utf-8", capture_output=True, check=True)
    for line in p.stdout.splitlines():
        try:
            key, val = line.split(":", 1)
        except ValueError:
            continue
        if "Fetch URL" in key:
            return val.strip()
    raise ValueError("No remote")


if __name__ == "__main__":
    main()
