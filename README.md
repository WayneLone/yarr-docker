# yarr-docker
build yourself yarr docker image

## Dockerfile Comment

- Use `YARR_AUTHFILE` enviroment to protected website.
- Use `YARR_ADDR` environment variable to change http listen port ('0.0.0.0' is global listen, default is '127.0.0.1').
- Use `YARR_DB` environment variable to persistent data, prevent data loss.
​
Another, you can use `HTTP_PROXY` and `HTTPS_PROXY` to change cralwer client proxy.

## Deploy

use cli

```shell
docker run -itd \
  -p 80:7070 \
  -v ~/yarr/yarr.db:/data/yarr.db \
  -v ~/yarr/yarr.auth:/data/yarr.auth \
  --name yarr \
  vkarz/yarr:2.4.0
```

use `docker-compose` file

```yaml
services:
  yarr:
    container_name: yarr
    image: vkarz/yarr:2.4.0
    volumes:
      - ~/yarr/yarr.db:/data/yarr.db
      - ~/yarr/yarr.auth:/data/yarr.auth
    ports:
      - '80:7070'
```

## References

- [Docker based setup for self hosting](https://github.com/nkanaev/yarr/issues/173#issuecomment-1872587119)
