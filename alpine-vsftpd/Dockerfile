FROM alpine
ENV TZ=Asia/Tokyo
RUN apk update && apk upgrade && apk add --no-cache tzdata vsftpd \
    && u=local && p=localpassword \
    && adduser -D -G ftp -h /home/${u} -s /bin/false ${u} && echo "${u}:${p}"|chpasswd
EXPOSE 10090/tcp 10091/tcp 10092/tcp 10093/tcp 10094/tcp 10095/tcp 10096/tcp 10097/tcp 10098/tcp 10099/tcp 10100/tcp 20/tcp 21/tcp 22/tcp
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
