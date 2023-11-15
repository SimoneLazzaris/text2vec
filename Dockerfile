FROM python:3.11-slim
LABEL maintainer="Simone Lazzaris <simone@codenotary.com>"
WORKDIR /app
RUN apt-get update && apt-get -y install git git-lfs
RUN python -m venv /app
RUN /app/bin/pip3 install -U torch text2vec-service[http] gunicorn  && \
    git clone https://huggingface.co/shibing624/text2vec-base-multilingual
COPY start.sh http_exporter.py /app/
ENTRYPOINT /app/start.sh
