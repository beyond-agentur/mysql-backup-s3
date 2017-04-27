FROM alpine:3.5

RUN apk update
RUN apk add python py-pip py-setuptools git ca-certificates
RUN pip install python-dateutil

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

ADD backup.sh /usr/bin/backup.sh
chmod a+x /usr/bin/backup.sh

CMD [ 'backup.sh' ]