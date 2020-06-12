ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project JupyPack"

RUN pip install git+git://github.com/devnguyenduc/jupypack.git#egg=jupypack --quiet --no-cache-dir
