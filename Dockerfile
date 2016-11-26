FROM nginx

MAINTAINER Ron Sengupta

ENV LANG C.UTF-8

#RUN mkdir -p /etc/nginx/sites-enabled
RUN mkdir -p /var/www/html
RUN mkdir -p /etc/nginx/certs


COPY default /etc/nginx/conf.d/default.conf
COPY clisec.rhel-cdk.10.1.2.2.xip.io.crt /etc/nginx/certs/server.crt
COPY clisec.rhel-cdk.10.1.2.2.xip.io.key /etc/nginx/certs/server.key
COPY ca.crt /etc/nginx/certs/ca.crt
#COPY ca.srl /etc/nginx/certs/ca.crl




RUN echo "The Web Server is Running" > /var/www/html/index.html



# Define default command.

CMD ["nginx", "-g", "daemon off;"]


# Expose ports.

EXPOSE 443

