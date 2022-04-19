#!/usr/bin/env bash
#===========================================================================
# Works only with the official image available in the Mac App Store.
# Make sure you download the official installer before running this script.
#===========================================================================

# Create a DMG Disk Image
hdiutil create -o /tmp/Catalina.cdr -size 9000m -layout SPUD -fs HFS+J

# Mount it to your macOS
hdiutil attach /tmp/Catalina.cdr.dmg -noverify -mountpoint /Volumes/install_build

# Create macOS Catalina Installer
sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia  --volume /Volumes/install_build --nointeraction

# Unmount Catalina Disk
hdiutil detach /Volumes/Install\ macOS\ Catalina

# Convert the DMG file to an ISO file
hdiutil convert /tmp/Catalina.cdr.dmg -format UDTO -o /tmp/Catalina.iso

# Rename and Move to Desktop
mv /tmp/Catalina.iso.cdr ~/Desktop/Catalina.iso

# Remove temp .dmg
rm /tmp/Catalina.cdr.dmg
