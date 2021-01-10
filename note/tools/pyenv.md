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

## Simple Python Version Management: pyenv

### Install

- MacOS
```shell
brew update
brew install pyenv
```
- Ubuntu
```shell
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# For bash:
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# for Zsh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc
```

Then

### Useful Command

List available versions
```shell
$ pyenv install --list
```

Install specific version
```shell
$ pyenv install <version>
```

Check all versions installed on the host
```shell
$ pyenv versions
```

Check and set global python version
```shell
$ pyenv global
$ pyenv global <version>
```

Check and set local python version
```shell
$ pyenv local
$ pyenv local <version>
```

Check and set shell python version
```shell
$ pyenv shell
$ pyenv shell <version>
```

Difference between global, local and shell
- global means the whole
- local applies to only current folder
- shell applies to only current shell
The priority is shell > local > global




### Reference
[pyenv github](https://github.com/pyenv/pyenv)
[How to Install Pyenv on Ubuntu 18.04](https://www.liquidweb.com/kb/how-to-install-pyenv-on-ubuntu-18-04/)
