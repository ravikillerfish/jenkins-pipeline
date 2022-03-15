FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install nginx

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
