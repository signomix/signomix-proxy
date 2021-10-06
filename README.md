# signomix-proxy

Reverse proxy and API Gateway for [Signomix](https://github.com/signomix/signomix) platform.

|Version|Description|
|---|---|
|1.0.0| Initial release|


## Building and publishing the docker image

When building an image, a self signed certificate is generated for the domain named in the HOSTNAME argument. If you have purchased a certificate for your domain, you can mount it later to the container being launched.


```shell
$ docker build --build-arg HOSTNAME=domain_name -t repository_name:tag .
$ docker push repository_name:tag
```

e.g.

```shell
$ docker build --build-arg HOSTNAME=localhost -t my-repo/signomix-proxy:1.0.0 -t my-repo/signomix-proxy:latest .
$ docker push my-repo/signomix-proxy --all-tags
```

