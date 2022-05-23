FROM debian:stable
LABEL maintainer="Eugene Crosser <crosser@average.org>"

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update
RUN apt-get install --yes build-essential debhelper devscripts dh-python python3-all python3-setuptools

ENTRYPOINT ["/entrypoint.sh"]
