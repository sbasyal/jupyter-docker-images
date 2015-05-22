# Run with the DockerSpawner in JupyterHub
# docker build -t ptimof/systemuser .

FROM 3blades/anaconda-plus

MAINTAINER 3Blades <contact@3blades.io>

# fetch jupyterhub-singleuser entrypoint
ADD https://raw.githubusercontent.com/jupyter/jupyterhub/master/jupyterhub/singleuser.py /usr/local/bin/jupyterhub-singleuser
RUN chmod 755 /usr/local/bin/jupyterhub-singleuser

EXPOSE 8888

ENV SHELL /bin/bash

ADD systemuser.sh /srv/singleuser/systemuser.sh
CMD ["sh", "/srv/singleuser/systemuser.sh"]