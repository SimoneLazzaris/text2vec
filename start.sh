#!/bin/sh
/app/bin/gunicorn -D --bind 0.0.0.0:8081 http_exporter:gunicorn_app
/app/bin/service-server-start -model_dir /app/text2vec-base-multilingual
