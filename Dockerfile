FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git && apt-get install -y iputils-ping
RUN mkdir /datos

#WORKDIR
WORKDIR /datos
RUN touch f1.txt
RUN touch prueba.txt

#COPY
COPY index.html .
COPY app.log /datos

#ADD
ADD docs docs
ADD f* /datos/
ADD f.tar .

##ENV
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir1

#ARG
#ARG dir2
#RUN mkdir $dir2

#EXPOSE
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /data1

#VOLUME
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

#CMD
CMD /data1/entrypoint.sh
#ENTRYPOINT
#ENTRYPOINT ["/bin/bash"]
