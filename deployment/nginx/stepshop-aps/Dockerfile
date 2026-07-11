ARG BASE_IMAGE

FROM $BASE_IMAGE

ARG ENVIRONMENT

ADD ./${ENVIRONMENT}/templates /stepora/nginx/templates
COPY ./${ENVIRONMENT}/nginx.conf /stepora/nginx/conf/nginx.conf

# Overwrite default one
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
CMD ./entrypoint.sh
