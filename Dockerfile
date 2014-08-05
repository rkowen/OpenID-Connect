#
# Set up a OAuth2-Connect:1.0 server
#

# change this to a recent image
FROM	ubuntu:14.04
MAINTAINER rk@owen.sj.ca.us

USER	root
EXPOSE	80

RUN	apt-get -y -qq update
RUN	apt-get -y -qq upgrade

RUN	apt-get install -y -qq php5 php5-pgsql apache2 postgresql-client-9.3

RUN	/bin/rm /etc/apache2/sites-enabled/000-default.conf
ADD	fqdn.conf /etc/apache2/conf-enabled/
ADD	www.conf /etc/apache2/sites-enabled/

ADD	server.php		/var/www/html/
ADD	token.php		/var/www/html/
ADD	resource.php		/var/www/html/
ADD	oauth2-server-php/src	/var/www/html/

USER	root
ENV	APACHE_LOCK_DIR		/var/lock/apache2
ENV	APACHE_PID_FILE		/var/run/apache2.pid
ENV	APACHE_RUN_USER		www-data
ENV	APACHE_RUN_GROUP	www-data
ENV	APACHE_LOG_DIR		/var/log/apache2
CMD	["/usr/sbin/apache2", "-D", "FOREGROUND"]
#ENTRYPOINT	["/usr/sbin/apache2"]
#CMD	["-D", "FOREGROUND"]
