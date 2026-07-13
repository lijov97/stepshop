FROM nginx:1.27-alpine

ARG ENVIRONMENT=production

COPY ${ENVIRONMENT}/nginx.conf /etc/nginx/nginx.conf
COPY ${ENVIRONMENT}/templates/ /etc/nginx/templates/

COPY entrypoint.sh entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
