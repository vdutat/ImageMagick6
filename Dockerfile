FROM alpine
MAINTAINER Vincent Dutat <vincent.dutat@gmail.com>
ARG RELEASE=6.9.10-23
RUN apk update
RUN apk add --no-cache git sudo autoconf g++ gcc make pkgconfig build-base \
  bash \
  ghostscript-dev libpng libx11-dev libxext-dev libxml2-dev libjpeg zlib-dev freetype freetype-dev libjpeg-turbo-dev libpng-dev opus-dev cairo-tools cairo-dev fontconfig-dev tiff-dev openexr-dev pango-dev libwmf-dev librsvg librsvg-dev libltdl jpeg-dev lcms2-dev openjpeg-dev tk-dev tcl-dev
# zlib1g-dev libpng12-dev libjpeg-dev libfreetype6-dev

# 20210709 SUPNXP-34753 identify: delegate failed `'ufraw-batch'
RUN apk --no-cache --update add libraw
RUN apk --no-cache --update add libtool

RUN apk --no-cache --update add --virtual=build-deps \
  make \
  && mkdir src \
  && (cd src \
    && git clone https://github.com/ImageMagick/ImageMagick6.git \
    && cd ImageMagick6 \
    && git checkout ${RELEASE} \
    && ./configure --with-gslib --with-ltdl=yes --with-rsvg --with-png \
    --with-raw=yes \
    && sudo make \
    && sudo make install \
    && sudo ldconfig /usr/local/lib \
  ) \
  && rm -rf src \
  && apk del build-deps

#CMD ["/bin/bash"]
