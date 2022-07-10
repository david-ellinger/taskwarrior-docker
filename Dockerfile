FROM alpine:3.16

RUN apk add --no-cache --no-progress taskd taskd-pki

COPY add_user.sh /usr/local/sbin/add_user
RUN chmod +x /usr/local/sbin/add_user
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ARG TASKDDATA
ENV TASKDDATA /var/taskd

RUN mkdir -p ${TASKDDATA}
WORKDIR ${TASKDDATA}

VOLUME ["${TASKDDATA}"]

EXPOSE 53589

ENTRYPOINT ["/docker-entrypoint.sh"]
