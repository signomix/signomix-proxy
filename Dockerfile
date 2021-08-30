FROM nginx:alpine

### certificate and key
### FOR PRODUCTION - UNCOMMENT CHANGE SOURCE PATHS BELOW

# COPY /my-certificates/my-bundle.crt /etc/nginx/signomix.crt
# COPY /my-certificates/my-key.key /etc/nginx/signomix.key

### configuration
### 

COPY nginx-local.conf /etc/nginx/nginx.conf
#COPY nginx.conf /etc/nginx/nginx.conf
