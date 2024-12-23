FROM fukamachi/sbcl:2.3.8 AS build

WORKDIR /home

RUN apt-get update \
    && apt-get install -y libmagic-dev libc6-dev gcc wget git make libreadline-dev

COPY . .

# install CIEL dependencies
RUN mkdir -p ~/common-lisp \
    && ( cd ~/common-lisp/ && wget https://asdf.common-lisp.dev/archives/asdf-3.3.5.tar.gz  && tar -xvf asdf-3.3.5.tar.gz && mv asdf-3.3.5 asdf )

RUN cp -r ~/.roswell/lisp/quicklisp/ ~/ \
    && ln -sf ~/quicklisp/setup.lisp ~/quicklisp/setup

RUN make ql-deps \
    &&make build \
    && cp ./ciel /usr/local/bin/

