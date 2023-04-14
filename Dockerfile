FROM ubuntu:20.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install --no-install-recommends -y ca-certificates curl && rm -rf /var/lib/apt-get/lists/*

RUN curl https://dl.google.com/go/go1.20.linux-amd64.tar.gz | tar -C /usr/local -xz

ENV PATH /usr/local/go/bin:$PATH
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$PATH

RUN go install github.com/playwright-community/playwright-go/cmd/playwright@latest \
      && playwright install --with-deps
