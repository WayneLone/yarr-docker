# yarr-docker
build yourself yarr docker image

## Dockerfile Comment

- Use `YARR_AUTHFILE` enviroment to protected website.
- Use `YARR_ADDR` environment variable to change http listen port ('0.0.0.0' is global listen, default is '127.0.0.1').
- Use `YARR_DB` environment variable to persistent data, prevent data loss.
​
Another, you can use `HTTP_PROXY` and `HTTPS_PROXY` to change cralwer client proxy.
