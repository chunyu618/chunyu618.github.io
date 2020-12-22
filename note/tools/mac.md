## Useful MacOS commands and tools

### Outline
- Security and Keychain
    - [Unlock a Keychain](#unlock-a-keychain)
    - [Lock a Keychain](#lock-a-keychain)
    - [Import a Certification](#import-a-certification)
- Homebrew
    - [Clean up Old Packages Version ](#clean-up-old-packages-version)
    - [brew install v.s. brew cask install](#brew-install-vs-brew-cask-install)
- Launch Agent
    - [Setting Global Environment Variables](#setting-global-environment-variables)
    - [Checking plist Files](#checking-plist-files)

### Unlock a Keychain
```shell
$ security unlock-keychain -p '<password>' /path/to/login.keychain    
```

### Lock a Keychain
```shell
$ security lock-keychain /path/to/login.keychain    
```

### Import a Certification
```shell

```

### Clean up Old Packages Version
```shell
$ brew cleanup
```

or run after updating and upgrading to get rid of old packages

```shell
$ brew update && brew upgrade && brew cleanup
```

following command will clean up cask packages, too.
```shell
$ brew cask cleanup
```

### brew install v.s. brew cask install
Homebrew-Cask is the extension of Homebrew to install GUI applications such as Google Chrome.

### Setting Global Environment Variables
Create a plist file, like `environment.plist`, under `~/Library/LaunchAgents/`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
  <dict>
  <key>Label</key>
  <string>setenv.<%= @name %></string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/launchctl</string>
    <string>setenv</string>
    <string><%= @name %></string>
    <string><%= @value %></string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  <key>ServiceIPC</key>
  <false/>
</dict>
</plist>
```

And log out and in.

To activte the plist file, run below commands

```shell
$ launchctl load ~/Library/LaunchAgents/environment.plist
$ launchctl start ~/Library/LaunchAgents/environment.plist
```

If you just modified your plist file, see your update by following commands

```shell
$ launchctl stop ~/Library/LaunchAgents/environment.plist
$ launchctl unload ~/Library/LaunchAgents/environment.plist
$ launchctl load ~/Library/LaunchAgents/environment.plist
$ launchctl start ~/Library/LaunchAgents/environment.plist
```

### Checking plist Files

```shell
$ plutil environment.plist
```

