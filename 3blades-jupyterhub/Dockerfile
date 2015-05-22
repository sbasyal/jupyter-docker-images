# JupyterHub Docker image built from specific commit on master GitHub branch
# docker build -t 3blades/jupyterhub .

FROM ipython/ipython:3.x

MAINTAINER 3Blades <contact@3blades.io>

# install js dependencies
RUN npm install -g bower less
RUN npm install -g jupyter/configurable-http-proxy

RUN mkdir -p /srv/

WORKDIR /srv/

RUN git clone https://github.com/jupyter/jupyterhub.git
WORKDIR /srv/jupyterhub/
RUN git checkout $JUPYTERHUB_COMMIT
RUN pip3 install .

EXPOSE 8000

# Install dockerspawner and oauthenticator
RUN pip3 install docker-py

RUN pip3 install git+https://github.com/jupyter/dockerspawner.git
RUN pip3 install git+https://github.com/jupyter/oauthenticator.git

# Add variable to allow connecting to the docker host
ENV DOCKER_HOST unix://docker.sock

ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py
CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]