FROM alpine:3.18

RUN apk add --no-cache bash

WORKDIR /app

COPY scripts app/scripts/
COPY config/ app/config/


RUN chmod +x /app/scripts/*.sh

CMD ["/bin/bash","/app/scripts/trieur.sh","--help"]
