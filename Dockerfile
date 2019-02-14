FROM bitnami/minideb:stretch
LABEL maintainer="nopunkindented"

WORKDIR /tmp

RUN install_packages python3 \
		python3-pip \
		python3-setuptools \
		python3-dev \
		build-essential \
		supervisor

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -U pip
RUN pip3 install -r /tmp/requirements.txt

ADD api /npi/api/
ADD supervisor /etc/supervisor/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "--nodaemon"]
