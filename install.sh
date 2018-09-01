#!/bin/sh

set -e

# these variables can be overwritten
PREFIX="${PREFIX:-/usr}"
TAG="${TAG:-master}"
uninstall="${uninstall:-false}"

bin_name="suru-plus-folders"
gh_url="https://github.com/gusbemacbe"
gh_repo="$bin_name"
gh_desc="Suru++ Folders"

cat <<- EOF

  $gh_desc
  $gh_url/$gh_repo


EOF

_msg() {
    echo "=>" "$@" >&2
}

_rm() {
    # removes parent directories if empty
    sudo rm -rf "$1"
    sudo rmdir -p "$(dirname "$1")" 2>/dev/null || true
}

_download() {
    _msg "Getting the latest version from GitHub ..."
    wget -O "$temp_file" \
        "$gh_url/$gh_repo/archive/$TAG.tar.gz"
    _msg "Unpacking archive ..."
    tar -xzf "$temp_file" -C "$temp_dir"
}

_uninstall() {
    _msg "Deleting $gh_desc ..."
    _rm "$PREFIX/bin/$bin_name"
}

_install() {
    _msg "Installing ..."
    sudo mkdir -p "$PREFIX/bin"
    sudo install -m 755 "$temp_dir/$gh_repo-$TAG/$bin_name" \
        "$PREFIX/bin/$bin_name"
}

_cleanup() {
    _msg "Clearing cache ..."
    rm -rf "$temp_file" "$temp_dir"
    _msg "Done!"
}

trap _cleanup EXIT HUP INT TERM

temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"

if [ "$uninstall" = "false" ]; then
    _download
    _uninstall
    _install
else
    _uninstall
fi
