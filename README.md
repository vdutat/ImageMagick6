# TODOs

- fix missing delegate: `ltdl`
```
convert --version
Version: ImageMagick 6.9.10-36 Q16 x86_64 2021-03-24 https://imagemagick.org
Copyright: © 1999-2019 ImageMagick Studio LLC
License: https://imagemagick.org/script/license.php
Features: Cipher DPC OpenMP 
Delegates (built-in): bzlib cairo fontconfig freetype gslib jng jp2 jpeg lcms lzma openexr pangocairo png ps rsvg tiff wmf x xml zlib
```

# Build docker image

```
IM_VERSION=6.9.10-24
docker build -t vdutat/imagemagick6:${IM_VERSION} --build-arg RELEASE=${IM_VERSION} .
```

# Use built docker image

## Print ImageMagick version

```
IM_VERSION=6.9.10-24
docker run -it --rm  vdutat/imagemagick6:${IM_VERSION} convert --version
```

## Convert an image file

```
IM_VERSION=6.9.10-24
docker run -it --rm -v /home/vdutat/Downloads:/workspace vdutat/imagemagick6:${IM_VERSION} convert /workspace/blank.pdf /workspace/blank.png
```


```
IM_VERSION=6.9.10-24
INPUT_FILE=000GUIDESL204407390_GSSG_GKVIDG.PDF
OUTPUT_FILE=thumbnail.png
docker run -it --rm -v /home/vdutat/Downloads:/workspace vdutat/imagemagick6:${IM_VERSION} convert -define registry:temporary-path=/tmp -quiet -strip -thumbnail 1000x1000 -background transparent -gravity center -format png -quality 75 /workspace/$INPUT_FILE[0] /workspace/$OUTPUT_FILE
```
