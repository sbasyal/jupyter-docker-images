# jupyter-docker-images
Set of docker images to build notebook node for JupyterHub with Python2, Python3, Julia and R. Python libraries are from Anaconda.

## Build sequence

1) docker build -t 3blades/ipython 3blades-ipython/
2) docker build -t 3blades/anaconda 3blades-anaconda/
3) docker build -t 3blades/anaconda-plus 3blades-anaconda-plus/
4) docker build -t 3blades/systemuser 3blades-systemuser/

# Pull from DockerHub

docker pull 3blades/systemuser