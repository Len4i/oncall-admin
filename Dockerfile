FROM ubuntu:18.04

RUN apt-get update && apt-get -y dist-upgrade \
    && apt-get -y install libffi-dev libsasl2-dev python3-dev vim \
        sudo libldap2-dev libssl-dev python3-pip python3-setuptools python3-venv \
        mysql-client uwsgi uwsgi-plugin-python3 nginx \
    && rm -rf /var/cache/apt/archives/*



COPY . /root/oncall-admin/

WORKDIR /root/oncall-admin

RUN cd /root/oncall-admin/ && python3 setup.py install

COPY ./src/oncall_admin/static/ /usr/local/lib/python3.6/dist-packages/oncall_admin-0.0.1-py3.6.egg/oncall_admin/static/

CMD make