ARG BASE_IMAGE
FROM ${BASE_IMAGE}
ENV HOME=/home/omar
USER root
RUN mkdir -p $HOME
RUN yum --disablerepo=centos* -y install hostname httpd gettext
RUN yum -y install nss_wrapper
RUN yum clean all
RUN sed '/^omar/d' /etc/passwd > $HOME/passwd-template && \
    setcap cap_net_bind_service+ep /usr/sbin/httpd && \
    setcap cap_net_bind_service+ep /usr/sbin/apachectl
COPY docker/docs.conf /etc/httpd/conf.d/docs.conf
COPY docs.tgz /var/www/html/
WORKDIR  /var/www/html
RUN tar xfz docs.tgz && \
    mv ./site/* . &&\
    rm -rf site docs.tgz
ADD run-httpd.sh $HOME/run-httpd.sh
RUN chmod -v +x $HOME/run-httpd.sh && \
    chmod 770 /usr/share/httpd && \
    chmod 770 /var/run/httpd && \
    chown 1001:0 /run/httpd && \
    chown 1001:0 /var/log/httpd && \
    chmod 770 /var/log/httpd && \
    chmod g+s /var/run/httpd && \
    find /usr/share/httpd -type d -exec chmod g+xws {} \\; && \
    find /usr/share/httpd -type f -exec chmod g+rw {} \\; && \
    find /etc/httpd -type d -exec chmod g+rw {} \\; && \
    find /etc/pki -type d -exec chmod g+xws {} \\; && \
    find /etc/pki -type f -exec chmod g+rw {} \\; && \
    chown -R 1001:0 /usr/share/httpd && \
    chown -R 1001:0 /etc/httpd && \
    chown -R 1001:0 /etc/pki && \
    find $HOME -type d -exec chmod g+xws {} \\; && \
    find $HOME -type f -exec chmod g+rw {} \\; && \
    chown -R 1001:0 $HOME && \
    chmod 770 $HOME/*.sh && \
    chown -R 1001:0 $HOME
VOLUME /dev/random
EXPOSE 80 443
WORKDIR $HOME
USER 1001
CMD /home/omar/run-httpd.sh