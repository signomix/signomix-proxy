FROM nginx:alpine

# certificate and key
# CHANGE SOURCE PATHS BELOW
COPY /my-certificates/my-bundle.crt /etc/nginx/signomix.crt
COPY /my-certificates/my-key.key /etc/nginx/signomix.key

# configuration
COPY nginx.conf /etc/nginx/nginx.conf