#!/usr/bin/env bash
# Author: Raoul Comninos
# Description: Updates all of the Emacswiki files I use
# Date: 7 March 2025

# Default settings
SLEEP_TIME=2
FORCE_DOWNLOAD=false

# Parse command-line options
while getopts "s:fh" opt; do
    case $opt in
        s) SLEEP_TIME="$OPTARG" ;;
        f) FORCE_DOWNLOAD=true ;;
        h)
            echo "Usage: $0 [-s seconds] [-f] [-h]"
            echo "  -s seconds  : Sleep time between downloads (default: 2)"
            echo "  -f          : Force re-download even if files exist"
            echo "  -h          : Show this help message"
            exit 0
            ;;
        *)
            echo "Invalid option. Use -h for help."
            exit 1
            ;;
    esac
done

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
dest_dir="$HOME/.emacs.d/wiki/"

# Create the directory if it does not exist
mkdir -p "$dest_dir"

# Initialize counters
total_packages=${#packages[@]}
current=0
success_count=0
skip_count=0
failed_packages=()

echo "Starting download of $total_packages packages to $dest_dir"
echo "========================================================"

# Download each package
for pkg in "${packages[@]}"; do
    ((current++))
    url="https://www.emacswiki.org/emacs/download/$pkg"
    dest_file="$dest_dir/$pkg"

    # Check if file exists and skip if not forcing
    if [[ -f "$dest_file" && "$FORCE_DOWNLOAD" == false ]]; then
        echo "[$current/$total_packages] Skipping $pkg (already exists)"
        ((skip_count++))
        continue
    fi

    echo "[$current/$total_packages] Downloading $pkg..."

    # Download with error handling
    if curl -f -s -S -o "$dest_file" "$url"; then
        ((success_count++))
        echo "  ✓ Success"
    else
        failed_packages+=("$pkg")
        echo "  ✗ Failed"
    fi

    # Sleep between downloads (except after last package)
    if [[ $current -lt $total_packages && $SLEEP_TIME -gt 0 ]]; then
        sleep "$SLEEP_TIME"
    fi
done

# Print summary
echo ""
echo "========================================================"
echo "Download Summary:"
echo "  Total packages: $total_packages"
echo "  Successfully downloaded: $success_count"
echo "  Skipped (already exist): $skip_count"
echo "  Failed: ${#failed_packages[@]}"

if [[ ${#failed_packages[@]} -gt 0 ]]; then
    echo ""
    echo "Failed packages:"
    for pkg in "${failed_packages[@]}"; do
        echo "  - $pkg"
    done
    exit 1
fi

echo ""
echo "All packages downloaded successfully!"
