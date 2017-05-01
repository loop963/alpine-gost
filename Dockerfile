FROM alpine

MAINTAINER mixool0204@gmail.com

RUN apk add --no-cache --virtual=.build-dependencies go gcc git libc-dev ca-certificates \
    && export GOPATH=/tmp/go \
    && git clone https://github.com/ginuerzh/gost $GOPATH/src/github.com/ginuerzh/gost \
    && cd $GOPATH/src/github.com/ginuerzh/gost/cmd/gost \
    && go build \
    && ls -a \
    && mv $GOPATH/src/github.com/ginuerzh/gost/cmd/gost/* /usr/local/bin/ \
    && cd //usr/local/bin \
    && ls -a
    && apk del .build-dependencies \
    && rm -rf /tmp

ENTRYPOINT ["/usr/local/bin/gost"]
