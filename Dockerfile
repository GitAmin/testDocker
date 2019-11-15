FROM centos

RUN yum update && \
    yum install -y vim && \
    yum clean all
CMD echo 'Hello world'
