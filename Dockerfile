FROM ubuntu:bionic

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc

# Enable IPv4
RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9

VOLUME ["/etc/bind"]

# Run eternal loop
CMD ["/bin/bash", "-c", "while :; do sleep 10; done"]