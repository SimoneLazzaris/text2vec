FROM python:3.11-slim
LABEL maintainer="Simone Lazzaris <simone@codenotary.com>"
WORKDIR /app
RUN apt-get update && apt-get -y install git git-lfs
RUN python -m venv /app
RUN /app/bin/pip3 install torch && \
    /app/bin/pip3 install -U text2vec-service[http] && \
    git clone https://huggingface.co/shibing624/text2vec-base-multilingual
COPY start.sh http_exporter.py /app
ENTRYPOINT /app/bin/service-server-start -model_dir /app/text2vec-base-multilingual -http_port 8081
