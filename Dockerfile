FROM debian:stretch-slim

COPY . /odoo

WORKDIR /odoo

RUN chmod 755 /odoo/wait-for.sh

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 libpq-dev build-essential python3-dev libxml2-dev python3-pip libsasl2-dev libldap2-dev libssl-dev netcat python3-setuptools python3-wheel && \
    pip3 install -r requirements.txt && \
    apt-get remove --purge -y build-essential python3-pip *-dev