FROM nginx:alpine

##### DOMAIN argument is mandatory
#
ARG DOMAIN
ENV MYDOMAIN=localhost
RUN echo ${DOMAIN}

#RUN test -n "$DOMAIN" || (echo "ERROR! --build-arg DOMAIN argument not set" && false)
RUN if [ ! -z "$DOMAIN" ]; then export MYDOMAIN="${DOMAIN}"; else export MYDOMAIN="localhost" ; fi && \
    echo MYDOMAIN=${MYDOMAIN}
##### Generate self signed certificate for domain name set with --build-arg HOSTNAME argument
#
RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/* && \ 
    mkdir /etc/nginx/keys && \
    if [ ! -z "$DOMAIN" ]; then export MYDOMAIN="${DOMAIN}"; else export MYDOMAIN="localhost" ; fi && \
    openssl req -x509 -nodes -subj '/CN='${MYDOMAIN} -newkey rsa:4096 -keyout /etc/nginx/keys/signomix.key -out /etc/nginx/keys/signomix.crt -days 365

##### Show resulting certificate
#
RUN openssl x509 -text -noout -in /etc/nginx/keys/signomix.crt | grep "Issuer:"

##### Copy NGINX configuration
#
COPY nginx.conf /etc/nginx/nginx.conf

#### Copy static files
#COPY static/main/js/* /var/www/public/main/js/
#COPY static/main/resources/* /var/www/public/main/resources/
#COPY static/app/js/* /var/www/public/app/js/
#COPY static/app/resources/* /var/www/public/app/resources/
#RUN chown -R "$USER":www-data /var/www/public
#RUN chmod -R 0755 /var/www/public

##### Replace localhost with the domain name
# 
RUN if [ ! -z "$DOMAIN" ]; then export MYDOMAIN="${DOMAIN}"; else export MYDOMAIN="localhost" ; fi && \
    sed -i 's/localhost/'${MYDOMAIN}'/g' /etc/nginx/nginx.conf
RUN cat /etc/nginx/nginx.conf | grep "domain name"
