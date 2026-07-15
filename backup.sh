#!/bin/bash

set -e

BACKUP_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Starting backup..."

# User configs
echo "Backing up user configs..."

mkdir -p "$BACKUP_DIR/config"

for folder in hypr btop htop; do
    SOURCE="$HOME/.config/$folder"
    DEST="$BACKUP_DIR/config/$folder"

    if [ -d "$SOURCE" ]; then
        if [ "$(realpath "$SOURCE")" = "$(realpath "$DEST")" ]; then
            echo "Skipping $folder (already linked)"
        else
            rm -rf "$DEST"
            cp -r "$SOURCE" "$BACKUP_DIR/config/"
            echo "Copied $folder"
        fi
    fi
done

# System configs
echo "Backing up system configs..."

mkdir -p "$BACKUP_DIR/system"

# TLP power settings
if [ -f /etc/tlp.conf ]; then
    sudo cp /etc/tlp.conf "$BACKUP_DIR/system/"
fi

if [ -d /etc/tlp.d ]; then
    sudo cp -r /etc/tlp.d "$BACKUP_DIR/system/"
fi


# Udev rules
if [ -d /etc/udev/rules.d ]; then
    mkdir -p "$BACKUP_DIR/system/udev"
    sudo cp -r /etc/udev/rules.d "$BACKUP_DIR/system/udev/"
fi


# Modprobe rules
if [ -d /etc/modprobe.d ]; then
    mkdir -p "$BACKUP_DIR/system/modprobe.d"
    sudo cp -r /etc/modprobe.d "$BACKUP_DIR/system/"
fi


# Kernel package list
echo "Saving package list..."

pacman -Qqe > "$BACKUP_DIR/packages.txt"


# AUR packages (if yay exists)
if command -v yay &> /dev/null; then
    yay -Qqe > "$BACKUP_DIR/aur-packages.txt"
fi


# Git update
echo "Updating Git..."

cd "$BACKUP_DIR"

git add .

git commit -m "Backup $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"

echo "Backup complete!"
