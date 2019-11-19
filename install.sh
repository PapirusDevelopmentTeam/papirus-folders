#!/bin/sh

set -e

# these variables can be overwritten
: "${PREFIX:=/usr}"
: "${TAG:=master}"
: "${uninstall:=false}"

bin_name="papirus-folders"
gh_url="https://github.com/PapirusDevelopmentTeam"
gh_repo="$bin_name"
gh_desc="Papirus Folders"

cat <<- EOF



      ppppp                         ii
      pp   pp     aaaaa   ppppp          rr  rrr   uu   uu     sssss
      ppppp     aa   aa   pp   pp   ii   rrrr      uu   uu   ssss
      pp        aa   aa   pp   pp   ii   rr        uu   uu      ssss
      pp          aaaaa   ppppp     ii   rr          uuuuu   sssss
                          pp
                          pp



  $gh_desc
  $gh_url/$gh_repo


EOF

_msg() {
    echo "=>" "$@"
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
    _rm "$PREFIX/share/bash-completion/completions/$bin_name"
    _rm "$PREFIX/share/zsh/site-functions/_$bin_name"
    _rm "$PREFIX/share/zsh/vendor-completions/_$bin_name"
}

_install() {
    # strip leading `v` symbol
    tag="${TAG#v}"

    _msg "Installing ..."
    sudo mkdir -p "$PREFIX/bin"
    sudo install -m 755 "$temp_dir/$gh_repo-$tag/$bin_name" \
        "$PREFIX/bin/$bin_name"
    sudo mkdir -p "$PREFIX/share/bash-completion/completions"
    sudo install -m 644 "$temp_dir/$gh_repo-$tag/completion/$bin_name" \
        "$PREFIX/share/bash-completion/completions"
    if [ -d "$PREFIX/share/zsh/site-functions" ]; then
        sudo install -m 644 "$temp_dir/$gh_repo-$tag/completion/_$bin_name" \
            "$PREFIX/share/zsh/site-functions"
    elif [ -d "$PREFIX/share/zsh/vendor-completions" ]; then
        sudo install -m 644 "$temp_dir/$gh_repo-$tag/completion/_$bin_name" \
            "$PREFIX/share/zsh/vendor-completions"
    else :
    fi
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
