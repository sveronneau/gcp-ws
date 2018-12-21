FROM alpine

RUN apk add -U curl privoxy jq && \
    mv /etc/privoxy/templates /etc/privoxy-templates && \
    rm -rf /var/cache/apk/* /etc/privoxy/* && \
    mv /etc/privoxy-templates /etc/privoxy/templates
ADD --chown=privoxy:privoxy config \
    /etc/privoxy/
ADD --chown=privoxy:privoxy k8s-only.action \
    /etc/privoxy/
ADD --chown=privoxy:privoxy k8s-rewrite-external.filter \
    /etc/privoxy/
ADD k8s-api-proxy.sh /

EXPOSE 8118/tcp

ENTRYPOINT ["./k8s-api-proxy.sh"]
