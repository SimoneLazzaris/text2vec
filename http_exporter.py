#!/usr/bin/env python3

from service.server import http_proxy
class Arguments:
    def __init__(self):
        self.port=5555
        self.port_out=5556
        self.http_port=8082
        self.cors="*"
        self.http_max_connect=10

prox = http_proxy.BertHTTPProxy(Arguments())
gunicorn_app = prox.create_flask_app()
