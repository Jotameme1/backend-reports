FROM python:3.9
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install gcc -y && \
    apt-get install python3-mysqldb -y && \
    pip install --upgrade pip && \
    apt-get install cron -y && \
    apt-get install supervisor 

RUN mkdir -p /opt/report
RUN mkdir -p /opt/flags
WORKDIR /opt/report

COPY requirements.txt /opt/report/requirements.txt
COPY src/ /opt/report
RUN pip install --no-cache-dir -r requirements.txt

COPY conf/supervisord.conf /etc/supervisord.conf
COPY conf/cron /var/spool/cron/crontabs/root
COPY scripts/start.sh /start.sh

#SSH
RUN echo "root:Docker!" | chpasswd
RUN mkdir -p /var/run/sshd
COPY conf/sshd_config /etc/ssh

ENV TZ=America/Santiago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN chmod 755 /start.sh

EXPOSE 8080 2222

CMD ["/start.sh"]