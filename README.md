# signomix-proxy

Reverse proxy and API Gateway for [Signomix](https://github.com/signomix/signomix) platform.

|Version|Description|
|---|---|
|1.0.0| Initial release|


## Building and publishing the docker image

Edit `Dockerfile` and use `nginx-local.conf` to build the image without SSL or `nginx.conf` and your certificate files for production use.


```shell
$ docker build -t repository_name:tag .
$ docker push repository_name:tag
```

e.g.

```shell
$ docker build -t my-repo/signomix-proxy:1.0.0 .
$ docker push my-repo/signomix-proxy:1.0.0
```
