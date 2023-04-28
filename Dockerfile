FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
ARG GO_VERSION=1.20

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
      && apt-get install --no-install-recommends -y build-essential ca-certificates wget \
      && wget -O /tmp/go.tar.gz https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz \
      && tar -C /usr/local -xzf /tmp/go.tar.gz \
      && rm /tmp/go.tar.gz \
      && rm -rf /var/lib/apt-get/lists/*

ENV PATH /usr/local/go/bin:$PATH
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$PATH

RUN go install github.com/playwright-community/playwright-go/cmd/playwright@latest \
      && playwright install --with-deps
