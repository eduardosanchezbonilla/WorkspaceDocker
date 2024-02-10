FROM jupyter/all-spark-notebook:latest
USER root

RUN apt-get update
RUN apt-get install -y graphviz libgraphviz-dev pkg-config enchant-2
RUN pip install pydot
RUN pip install boto3
RUN pip install pyenchant
