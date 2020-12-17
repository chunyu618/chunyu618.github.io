## Useful MacOS commands and tools

### Outline
- Security and Keychain
    - [Unlock a Keychain](#unlock-a-keychain)
    - [Lock a Keychain](#lock-a-keychain)
    - [Import a Certification](#import-a-certification)
- Homebrew
    - [Clean up Old Packages Version ](#clean-up-old-packages-version)
    - [brew install v.s. brew cask install](#brew-install-vs-brew-cask-install)

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

