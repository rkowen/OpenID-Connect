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

The PostgreSQL-* images rely on the "official" PostgreSQL Docker image,
which should be downloaded to your local set of images with:

```
	docker pull postgres:9.3.4
```

## PostgreSQL-prep

You will need to run the postgres-prep docker image to create a user and
database.  View its documentation for details.

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

Go to Brent Shaffer's step-by-step walkthrough on his PHP version of the
OpenID Connect 1.0 server

http://bshaffer.github.io/oauth2-server-php-docs/cookbook/

