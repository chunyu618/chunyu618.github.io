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
- Fastlane
    - [2FA Cookie](#2fa-cookie)

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

### 2FA Cookie

Location
```shell
~/.fastlane/spaceship/[email]/cookie
```

Environment Variable
```shell
export FASTLANE_SESSION='---\n- !ruby/object:HTTP::Cookie\n  name: DES5c148586dfd451e55afbaaa5f62418f91\n  value: HSARMTKNSRVTWFla1+yO4gVPowH17VaaaxPFnUdMUegQZxqy1Ie1c2v6bM1vSOzIbuOmrl/FNenlScsd/NbF7/Lw4cpnL15jsyg0TOJwP32tC/NguPiyOaaaU+jrj4tf4uKdIywVaaaFSRVT\n  domain: idmsa.apple.com\n  for_domain: true\n  path: "/"\n  secure: true\n  httponly: true\n  expires: 2016-04-27 23:55:56.000000000 Z\n  max_age: \n  created_at: 2016-03-28 16:55:57.032086000 -07:00\n  accessed_at: 2016-03-28 19:11:17.828141000 -07:00\n'
```
