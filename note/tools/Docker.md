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

# Docker

### A Simple Way to Setup a container

The easiest and common command in docker is `docker run`, for exmaple

```shell
$ docker run alpine echo "Hello"
Hello
```

 To output `Hello` in stdout.



### Useful command

```
$ docker ps
$ docker container ls -a
$ docker container rm <Container ID>
$ docker network ls
$ docker network rm <Network ID>
```





### Some options

- `-i, --interactive, Keep STDIN open even if not attached`

    Connect the `STDIN` of terminal to the `STDIn` of the container.

- `-t, --tty, Allocate a pseudo-TTY`

    It tells the main process of the container that its input is a terminal device.

- `-d, --detach, Run container in background and print container ID`

    Just run the container in background

	





### Reference

- [Bridge Network 簡介](https://godleon.github.io/blog/Docker/docker-network-bridge/)
- [Confused about Docker -t option to Allocate a pseudo-TTY](https://stackoverflow.com/questions/30137135/confused-about-docker-t-option-to-allocate-a-pseudo-tty)
- https://joshhu.gitbooks.io/dockercommands/content/Containers/DockerRun.html

