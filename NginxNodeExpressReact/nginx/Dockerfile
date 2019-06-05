FROM nginx:alpine

# RUN rm /etc/nginx/nginx.conf
# ADD nginx.conf /etc/nginx/

RUN rm /etc/nginx/conf.d/*
COPY steemy.conf /etc/nginx/conf.d/

COPY ./static/index.html /usr/share/nginx/html