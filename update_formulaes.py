#!/usr/bin/env python3
from __future__ import annotations

import os
import sys

import requests
from jinja2 import Environment, DictLoader, select_autoescape

REPO = os.getenv("REPOSITORY", "messense/homebrew-macos-cross-toolchains")
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")

session = requests.Session()


def fetch_targets_from_latest_release():
    headers = {"Accept": "application/vnd.github.v3+json"}
    if GITHUB_TOKEN:
        headers["Authorization"] = f"token {GITHUB_TOKEN}"
    res = session.get(
        f"https://api.github.com/repos/{REPO}/releases/latest",
        headers=headers,
    )
    res.raise_for_status()
    release = res.json()
    version = release["tag_name"].removeprefix("v")
    targets = {}
    for asset in release["assets"]:
        filename = asset["name"]
        if filename.endswith(".sha256"):
            sha256_res = session.get(asset["browser_download_url"]).text
            sha256, artifact_name = sha256_res.split()
            if "aarch64-darwin" in artifact_name:
                arch = "aarch64"
                target = artifact_name.removesuffix("-aarch64-darwin.tar.gz")
            elif "x86_64-darwin" in artifact_name:
                arch = "x86_64"
                target = artifact_name.removesuffix("-x86_64-darwin.tar.gz")
            else:
                raise ValueError("unknown architecture")
            if target not in targets:
                targets[target] = {
                    "version": version,
                    "name": target.title().replace("-", "").replace("_", ""),
                    "description": f"{target} Toolchain",
                }
            if arch == "aarch64":
                targets[target]["aarch64_sha256"] = sha256
                targets[target]["aarch64_artifact_name"] = artifact_name
            elif arch == "x86_64":
                targets[target]["x86_64_sha256"] = sha256
                targets[target]["x86_64_artifact_name"] = artifact_name
    return targets


def main():
    targets = fetch_targets_from_latest_release()
    with open("formula.rb.j2") as f:
        env = Environment(
            loader=DictLoader({"formula": f.read()}),
            autoescape=select_autoescape(),
        )
    template = env.get_template("formula")
    for target, context in targets.items():
        rendered = template.render(**context)
        with open(f"{target}.rb", "w") as f:
            f.write(rendered)
            f.write("\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
