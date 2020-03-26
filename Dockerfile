FROM alpine:3.11.5
RUN apk add ca-certificates
RUN apk add supervisor
RUN apk add syslog-ng
RUN apk add postfix
RUN echo -n > /etc/postfix/aliases
COPY main.cf /etc/postfix/
COPY master.cf /etc/postfix/
COPY syslog-ng.conf /etc/syslog-ng/
COPY supervisord.conf /etc/supervisor/
COPY launch-postfix.sh /usr/bin/
CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
