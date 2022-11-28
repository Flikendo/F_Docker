# Autokey-gtk
This is a Docker project. It contains a Dockerfile to create Autokey-gtk images thus, containers.

With Autokey-gtk we will be able to create different macros so that repeat pattern of uses.

INFO: http://manpages.ubuntu.com/manpages/bionic/man1/autokey-gtk.1.html

***

## Building an image
Follow the same process as an ordinary Dockerfile

```
docker build .
```

## Running a container
In order to run a container which is able to export X's view, launch the container with the 
command below.
Firstly check IP+PORT in X server.
```
docker run -e DISPLAY="<IP:PORT>" -v /tmp/.X11-unix:/tmp.X11-unix <CONTAINERID> sleep infinity
```
