#!/usr/bin/env bash
set -euo pipefail

if (( $# < 1 || $# > 3 )); then
    echo "Usage: bash install.sh {codex|claude|antigravity} [user|project] [skill-name]" >&2
    exit 1
fi

case "$1" in
    codex) user_dir=.agents; project_dir=.agents ;;
    claude) user_dir=.claude; project_dir=.claude ;;
    antigravity) user_dir=.gemini/config; project_dir=.agents ;;
    *) echo "Unknown client: $1" >&2; exit 1 ;;
esac

case "${2:-user}" in
    user) install_root="$HOME/$user_dir/skills" ;;
    project) install_root="$PWD/$project_dir/skills" ;;
    *) echo "Unknown scope: $2" >&2; exit 1 ;;
esac

source_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../skills" && pwd)"
skill_name=${3:-}
if [[ -n "$skill_name" && ! "$skill_name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    echo "Invalid skill name: $skill_name" >&2
    exit 1
fi

shopt -s nullglob
if [[ -n "$skill_name" ]]; then
    sources=("$source_root/$skill_name")
else
    sources=("$source_root"/*/)
fi

installed=0
for source in "${sources[@]}"; do
    if [[ ! -f "$source/SKILL.md" ]]; then
        continue
    fi
    destination="$install_root/$(basename -- "$source")"
    mkdir -p -- "$destination"
    cp -R -- "$source/." "$destination/"
    echo "Installed $destination"
    installed=1
done

if (( ! installed )); then
    echo "No matching skill found in $source_root" >&2
    exit 1
fi
