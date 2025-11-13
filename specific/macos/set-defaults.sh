#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname)" != "Darwin" ]]; then
  exit 0
fi

####################
# Finder
####################

echo "› Configuring Finder"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
chflags nohidden ~/Library
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # search current folder

####################
# Launch Services
####################

echo "› Configuring Launch Services"
defaults write com.apple.LaunchServices LSQuarantine -bool false

####################
# Activity Monitor
####################

echo "› Configuring Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

####################
# AirDrop
####################

echo "› Configuring AirDrop"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -int 1

####################
# Dock
####################

echo "› Configuring Dock"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock show-recents -bool false # disable recent apps

####################
# Safari and WebKit
####################

echo "› Configuring Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari \
  com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

####################
# Mail
####################

echo "› Configuring Mail"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Restart affected apps
for app in "Finder" "Dock" "Activity Monitor" "Safari" "Mail"; do
  killall "$app" >/dev/null 2>&1 || true
done
echo "✅ macOS defaults set"
