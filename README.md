# OpenID-Connect
================

An OpenID-Connect image build directory that links to the "official" PostgreSQL image container.

This repository is a Docker image build directory maintained
by R.K. Owen, Ph.D. <rk@owen.sj.ca.us>

It's assumed you have some passing knowledge of Docker containers and how
to use them.  If not then browse http://docs.docker.com/ and try them
out for yourself.

Also it's assumed some knowledge of the PostgreSQL relational database and
its tools.

The PostgreSQL-xxx images rely on the "official" PostgreSQL Docker image,
which can be downloaded to your local set of images with:

```
	docker pull postgres:9.3.4
```

## PostgreSQL-prep

You will need to run the postgres-prep docker image to create a user and
database.  View that image's documentation for details.

Once the PostgreSQL image and preparation are complete then an OpenID Connect
container can be started 
pointing the localhost port 4180 to port 80 (http)
of the container.  Use can use whatever localhost port you want.

```
docker run --name openid-connect                                        \
        --link pgsql-server:pgsql                                       \
        --detach=true                                                   \
        --publish=4080:80                                               \
        openid-connect:1.0
```

The server is accessible at http://localhost:4180
and here are a coupld of ways to test it out with the testclient entry:

```
curl    -u testclient:testpass                                          \
        http://localhost:4180/token.php                                 \
        --data 'grant_type=client_credentials'
```

And you should see something like:

```
{"access_token":"50702f4122909a6a2d4769d7b5cc1987e939605d","expires_in":3600,"token_type":"Bearer","scope":null}
```

Go to Brent Shaffer's step-by-step walkthrough on his PHP version of the
OpenID Connect 1.0 server

http://bshaffer.github.io/oauth2-server-php-docs/cookbook/

