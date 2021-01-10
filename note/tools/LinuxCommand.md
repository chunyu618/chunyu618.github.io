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

## Useful Linux command

### Outline 

### Check If File Exists 
```shell
[ -e "/path/to/file" ] && echo "File /path/to/file exists."
[ ! -e "/path/to/file" ] && echo "File /path/to/file DOES NOT exists."
```

### Check If Directory Exists 
```shell
[ -d "/path/to/dir" ] && echo "Directory /path/to/dir exists."
[ ! -d "/path/to/dir" ] && echo "Directory /path/to/dir DOES NOT exists."
```
