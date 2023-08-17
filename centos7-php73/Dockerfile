FROM centos:centos7
ENV TZ=Asia/Tokyo
RUN yum update -y && \
    yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum --enablerepo=epel,remi-php73 install -y php php-mbstring php-mysql php-xml php-mcrypt php-bcmath
COPY httpd.conf /etc/httpd/conf/httpd.conf
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
