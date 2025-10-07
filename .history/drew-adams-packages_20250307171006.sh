#!/usr/local/bin/bash
# Description: Updates all of the Emacswiki files I use
# Date: 7 March 2025

# The list of packages
packages=(
    icicles.el
    icicles-var.el
    icicles-opt.el
    icicles-mode.el
    icicles-mcmd.el
    icicles-mac.el
    icicles-fn.el
    icicles-face.el
    icicles-doc2.el
    icicles-doc1.el
    icicles-cmd2.el
    icicles-cmd1.el
    icicles-chg.el
    better-registers.el
    bookmark+-1.el
    bookmark+-bmu.el
    bookmark+-chg.el
    bookmark+-doc.el
    bookmark+-key.el
    bookmark+-lit.el
    bookmark+-mac.el
    bookmark+.el
    col-highlight.el
    crosshairs.el
    dired+.el
    festival.el
    fit-frame.el
    frame-cmds.el
    frame-fns.el
    grep+.el
    hide-comnt.el
    highlight.el
    hl-line+.el
    showkey.el
    sortie.el
    thing-cmds.el
    vline.el
    w32-browser.el
    zoom-frm.el
)

# The location to save the packages
dest_dir="/home/yal/.emacs.d/lisp/"

# Create the directory if it does not exist
mkdir -p "$dest_dir"

# Download each package
for pkg in "${packages[@]}"; do
    url="https://www.emacswiki.org/emacs/download/$pkg"
    dest_file="$dest_dir/$pkg"
    echo "Downloading $url"
    curl -o "$dest_file" "$url"
    echo "Pausing for 2 seconds..."
    sleep 2
done
