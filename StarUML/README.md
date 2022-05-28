# F_StarUML
This is a Docker project. It contains a Dockerfile to create StarUML images thus, containers.

With StartUML we will be able to create different diagrams such as Sequence Diagram, Classes
Diagram, etc.

INFO: https://staruml.io/

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
docker run -e DISPLAY="<IP:PORT>" -v /tmp/.X11-unix:/tmp.X11-unix
```
