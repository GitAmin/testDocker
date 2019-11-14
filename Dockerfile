FROM dlevray/basestack
MAINTAINER Amine LAHMAR <amin.lahmar@gmail.com>
LABEL version="1.1"
LABEL description="Keystone image for Openstack" 
LABEL readme="This image is used to install Keystone in OpenStack"

RUN yum install –y python-openstackclient openstack-selinux && \
    yum install -y mariadb mariadb-server python2-PyMySQL && \
    yum clean all

VOLUME /var/lib/mysql

COPY openstack.cnf /etc/my.cnf.d/openstack.cnf
COPY install_db_openstack.sql /tmp/install_db_openstack.sql
COPY docker-entrypoint.sh /usr/local/bin/

RUN ln -s /usr/local/bin/docker-entrypoint.sh / 
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
