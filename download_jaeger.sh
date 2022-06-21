#!/bin/bash
wget https://github.com/jaegertracing/jaeger/releases/download/v1.35.0/jaeger-1.35.0-linux-amd64.tar.gz
tar -zxvf jaeger-1.35.0-linux-amd64.tar.gz ./jaeger-1.35.0-linux-amd64/jaeger-all-in-one
mv ./jaeger-1.35.0-linux-amd64/jaeger-all-in-one ./jaeger-all-in-one
rmdir ./jaeger-1.35.0-linux-amd64