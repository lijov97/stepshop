FROM amazonlinux:2.0.20190823.1

RUN adduser -h /stepora -D stepora

WORKDIR /stepora

RUN mkdir logs
RUN chown -R stepora /stepora

ENV PATH "$PATH:/stepora/.local/bin"

# Add packages to the image
ADD ./deployment/app/packages/apk/base /stepora/packages/apk/base
#    apk add --no-cache bash=5.1.16-r2 postgresql13-dev=13.13-r0 librdkafka-dev=1.8.2-r0

# Install dependencies
RUN apk update && \
    apk add --no-cache --no-network /stepora/packages/apk/base/* && \
    pip3.7 install --no-cache-dir --upgrade pip==22.0.4 && \
    rm -rf /stepora/packages/apk

WORKDIR /stepora

ADD requirements.txt /stepora/requirements.txt

RUN pip3.7 install --no-cache-dir -r requirements.txt
WORKDIR /

ADD ./ /stepora

EXPOSE 8000

ENV C_FORCE_ROOT=1
