## created by Samih Hijwel - 7 Nov 2023

# default image is based on Debian
# FROM freeradius/freeradius-server:latest

# Alpine is lightweight (100MB), good for demos!
FROM freeradius/freeradius-server:latest-3.2-alpine

RUN apk update
RUN apk add iproute2
RUN apk add freeradius-utils

WORKDIR .

# Adding Nile radius dictionary and linking it
COPY dictionary.nile /usr/share/freeradius/
RUN mv /usr/share/freeradius/dictionary /usr/share/freeradius/dictionary-orig
RUN <<EOT
  grep -n "INCLUDE dictionary.nexans" /usr/share/freeradius/dictionary-orig | \
  cut -d':' -f1 | \
  xargs -I {} sed '{} a$INCLUDE dictionary.nile' /usr/share/freeradius/dictionary-orig > \
  /usr/share/freeradius/dictionary
EOT

# adding the config files
RUN mv /opt/etc/raddb /opt/etc/raddb-orig
COPY raddb/ /opt/etc/raddb/

# Exposing Radius ports
EXPOSE 1812/udp
EXPOSE 1813/udp

# Exposing DHCP port
# WARNING change this to 6700 so that the network doesn’t break
# EXPOSE 67
