## Download docker on ubuntu

1. `sudo apt update`

2. `sudo apt install apt-transport-https ca-certificates curl software-properties-common`

3. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

4. `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"`
5. `sudo apt update`
6. `apt-cache policy docker-ce`
7. `sudo apt install docker-ce`
8. 



### Reference 

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

https://medium.com/unorthodox-paranoid/docker-tutorial-101-c3808b899ac6