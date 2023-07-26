FROM emqx/emqx:v4.0.1

USER root

RUN apk update && apk add tzdata

COPY acl.conf /opt/emqx/etc/acl.conf

COPY wait.sh /wait
RUN chmod +x /wait
RUN chown emqx /wait
RUN chown -R emqx:emqx /wait
RUN chown -R emqx:emqx /opt/emqx

USER emqx

## Launch the wait tool and then your application
CMD /wait && /usr/bin/start.sh
