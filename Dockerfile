FROM nginx:alpine

##### DOMAIN argument is mandatory
#
ARG DOMAIN
RUN test -n "$DOMAIN" || (echo "ERROR! --build-arg DOMAIN argument not set" && false)

##### Generate self signed certificate for domain name set with --build-arg HOSTNAME argument
#
RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/* && \ 
    mkdir /etc/nginx/keys && \
    openssl req -x509 -nodes -subj '/CN='${DOMAIN}} -newkey rsa:4096 -keyout /etc/nginx/keys/signomix.key -out /etc/nginx/keys/signomix.crt -days 365

##### Show resulting certificate
#
#RUN openssl x509 -text -noout -in /etc/nginx/keys/signomix.crt

##### Copy NGINX configuration
#
COPY nginx.conf /etc/nginx/nginx.conf

##### Replace localhost with the domain name
# 
RUN sed -i 's/localhost/'${DOMAIN}'/g' /etc/nginx/nginx.conf
