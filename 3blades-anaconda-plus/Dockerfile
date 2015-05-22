FROM 3blades/anaconda

# Conda stuff
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

# MPI for IPython
RUN apt-get update \
 && apt-get build-dep -y mpi4py \
 && pip2 install mpi4py \
 && pip3 install mpi4py \
 && apt-get autoremove -y \
 && apt-get clean -y

# Goodies for IPython
RUN pip2 install terminado \
 && pip3 install terminado

# Database Python libraries
RUN apt-get install -y libpq-dev \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && pip2 install pymongo redis psycopg2 cloudant \
 && pip3 install pymongo redis psycopg2 cloudant

# Install Julia
RUN apt-get install -y software-properties-common python-software-properties \ 
 && add-apt-repository ppa:staticfloat/juliareleases \
 && add-apt-repository ppa:staticfloat/julia-deps \
 && apt-get update \
 && apt-get install -y julia libnettle4 \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && julia -e 'Pkg.add("IJulia")' \
 && julia -e 'Pkg.add("Gadfly")' \
 && julia -e 'Pkg.add("RDatasets")' \
 && (cd /root/.julia/v0.3 && rm .cache && ln -s ../.cache . && cd /root && tar zcf /usr/local/share/julia-cache.tar.gz .julia) \
 && rm -r /root/.julia

# R dependencies that conda can't provide (X, fonts)
RUN apt-get install -y libxrender1 fonts-dejavu && apt-get clean

# R packages
RUN conda config --add channels r
RUN conda install --yes r-irkernel r-plyr r-devtools r-rcurl r-dplyr r-ggplot2 r-caret && conda clean -yt

# QuantLib (with Python, PyQL, and R bindings)
RUN apt-get install -y libquantlib0 libquantlib0-dev quantlib-examples quantlib-refman-html quantlib-python r-cran-rquantlib \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && pip2 install tabulate \
 && pip3 install tabulate \
 && pip2 install git+https://github.com/enthought/pyql.git

# Expose the kernels
ADD kernels/ /usr/local/share/jupyter/kernels/
RUN pip install --user bash_kernel