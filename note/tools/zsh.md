<style>
    body{
    	font-size: 15pt;
    }
    h2{
        font-size: 28pt;
        font-weight: bold;
    }
    h3{
        font-size: 24pt;
        font-weight: bold;
    }
</style>

## Seting Zsh

### Ubuntu

```shell
# Update and upgrade
sudo apt-get update
sudo apt-get upgrade

# Install zsh
sudo apt-get install zsh

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# change default shell
chsh -s /bin/zsh

# Install Patch font
sudo apt-get install powerline
sudo apt-get install fonts-powerline

```

### Macos

### ZSH Themes List
https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

### Reference 
https://medium.com/statementdog-engineering/prettify-your-zsh-command-line-prompt-3ca2acc967f
