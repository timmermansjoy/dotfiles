#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
    # https://github.com/holman/dotfiles/blob/master/macos/set-defaults.sh
    # https://github.com/mathiasbynens/dotfiles/blob/master/.macos
    # https://github.com/cristiandean/dotfiles/blob/master/osx_config

    ####################
    # [finder]
    ####################

    # set the Finder prefs for showing a few different volumes on the Desktop
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    # show the ~/Library folder
    chflags nohidden ~/Library

    # avoid creating .DS_Store files on network or USB volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

    ####################
    # [launch]
    ####################

    # disable the “Are you sure you want to open this application?” dialog
    defaults write com.apple.LaunchServices LSQuarantine -bool false

    ####################
    # [activity monitor]
    ####################

    # show all processes in Activity Monitor
    defaults write com.apple.ActivityMonitor ShowCategory -int 0

    # sort Activity Monitor results by CPU usage
    defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
    defaults write com.apple.ActivityMonitor SortDirection -int 0

    ####################
    # [airdrop]
    ####################

    # use AirDrop over every interface
    defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

    ####################
    # [dock]
    ####################

    # make dock come up faster
    defaults write com.apple.dock autohide-delay -float 0

    # Set the icon size of Dock items
    defaults write com.apple.dock tilesize -int 30

    # Make Dock icons of hidden applications translucent
    defaults write com.apple.dock showhidden -bool true

    ###############################################################################
    # Safari & WebKit                                                             #
    ###############################################################################

    # Enable the Develop menu and the Web Inspector in Safari
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

    ###############################################################################
    # Mail                                                                        #
    ###############################################################################

    # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
    defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

fi
