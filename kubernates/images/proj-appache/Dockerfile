FROM ubuntu
RUN apt update
RUN apt install apache2 -y
RUN apt install git -y
EXPOSE 80
RUN rm -rf /var/www/html/index.html
RUN git clone https://github.com/krishnalogs/apachewebsite /var/www/html
CMD apachectl -D FOREGROUND
