#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM resin/rpi-raspbian:jessie

# Install Nginx.
RUN \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
		nginx \
		lsof && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx 

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

ADD script.sh /

# Define default command.
#CMD ["nginx"]
#CMD["script.sh"]
CMD [ "bash", "/script.sh" ]

# Expose ports.
EXPOSE 80
EXPOSE 443
