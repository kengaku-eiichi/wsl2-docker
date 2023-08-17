# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
FROM oraclelinux:7-slim

ENV TZ=Asia/Tokyo

#ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-5.7.33
#ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.22

# Install server
RUN yum localinstall -y https://repo.mysql.com/mysql80-community-release-el7-9.noarch.rpm \
  && yum update -y \
  && rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 \
#  && yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
#      https://repo.mysql.com/mysql-community-release-el7.rpm \
#  && yum-config-manager --enable mysql57-server-minimal \
  && yum-config-manager --disable  mysql55 mysql56-community mysql80-community \
  && yum-config-manager --enable mysql57-community \
#  && yum install -y $MYSQL_SERVER_PACKAGE $MYSQL_SHELL_PACKAGE libpwquality \
  && yum install -y mysql mysql-devel mysql-community-server mysql-utilities mysql-shell-8.0.22 libpwquality \
  && yum clean all \
  && mkdir /docker-entrypoint-initdb.d

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /entrypoint.sh
COPY healthcheck.sh /healthcheck.sh
ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
EXPOSE 3306 33060
CMD ["mysqld", "--user=mysql"]
