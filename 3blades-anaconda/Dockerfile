# IPython + Anaconda (https://store.continuum.io/cshop/anaconda/) 
# docker build -t 3blades/anaconda .

FROM 3blades/ipython

MAINTAINER 3Blades <contact@3blades.io>

ADD build_anaconda.sh /tmp/build_anaconda.sh
RUN bash /tmp/build_anaconda.sh

# Clean up from build
RUN rm -f /tmp/build_anaconda.sh