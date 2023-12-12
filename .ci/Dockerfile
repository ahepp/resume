FROM debian:bullseye-slim
RUN dpkg-reconfigure debconf -f noninteractive -p critical
RUN echo 'root:root' | chpasswd && \
    groupadd -g 1000 dev \
    && useradd -m -u 1000 -g dev dev

RUN apt-get update && apt-get install --no-install-recommends -y \
    ghostscript \
    imagemagick \
    make \
    texlive-latex-extra

RUN sed \
    -e 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' \
    -e 's/domain="resource" name="area" value=".*"/domain="resource" name="area" value="256MB"/' \
    -e 's/domain="resource" name="memory" value=".*"/domain="resource" name="memory" value="1GiB"/' \
    -e 's/domain="resource" name="map" value=".*"/domain="resource" name="map" value="2GiB"/' \
    -e 's/domain="resource" name="disk" value=".*"/domain="resource" name="disk" value="4GiB"/' \
    -i /etc/ImageMagick-6/policy.xml


USER dev
WORKDIR /ws
