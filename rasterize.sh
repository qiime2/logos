#!/usr/bin/env bash

ZIP=qiime2_logos_v8

rm -rf raster && mkdir -p raster/{transparent,white,icons}
mkdir raster/icons/{apple_iconset.iconset,ico}

# FAVICON
svgexport vector/qiime2-favicon.svg raster/icons/ico/qiime2-favicon-256.png
convert raster/icons/ico/qiime2-favicon-256.png -resize 16x16 raster/icons/ico/qiime2-favicon-16.png
convert raster/icons/ico/qiime2-favicon-256.png -resize 32x32 raster/icons/ico/qiime2-favicon-32.png
convert raster/icons/ico/qiime2-favicon-256.png -resize 64x64 raster/icons/ico/qiime2-favicon-64.png
convert raster/icons/ico/qiime2-favicon-256.png -resize 128x128 raster/icons/ico/qiime2-favicon-128.png
convert raster/icons/ico/qiime2-favicon-16.png \
    raster/icons/ico/qiime2-favicon-32.png \
    raster/icons/ico/qiime2-favicon-64.png \
    raster/icons/ico/qiime2-favicon-128.png \
    raster/icons/ico/qiime2-favicon-256.png \
    -colors 256 raster/icons/ico/favicon.ico

# APPLE ICONSET
svgexport vector/qiime2-square.svg raster/icons/apple_iconset.iconset/icon_16x16.png 16:
svgexport vector/qiime2-square.svg raster/icons/apple_iconset.iconset/icon_32x32.png 32:
svgexport vector/qiime2-square.svg raster/icons/apple_iconset.iconset/icon_128x128.png 128:
svgexport vector/qiime2-square.svg raster/icons/apple_iconset.iconset/icon_256x256.png 256:
svgexport vector/qiime2-square.svg raster/icons/apple_iconset.iconset/icon_512x512.png 512:
cp raster/icons/apple_iconset.iconset/icon_16x16.png raster/icons/apple_iconset.iconset/icon_16x16@2x.png
cp raster/icons/apple_iconset.iconset/icon_32x32.png raster/icons/apple_iconset.iconset/icon_32x32@2x.png
cp raster/icons/apple_iconset.iconset/icon_128x128.png raster/icons/apple_iconset.iconset/icon_128x128@2x.png
cp raster/icons/apple_iconset.iconset/icon_256x256.png raster/icons/apple_iconset.iconset/icon_256x256@2x.png
cp raster/icons/apple_iconset.iconset/icon_512x512.png raster/icons/apple_iconset.iconset/icon_512x512@2x.png

# SQUARE, TRANSPARENT, PNG
svgexport vector/qiime2-square.svg raster/transparent/qiime2-square-400.png
svgexport vector/qiime2-square.svg raster/transparent/qiime2-square-200.png 200:
svgexport vector/qiime2-square.svg raster/transparent/qiime2-square-100.png 100:
svgexport vector/qiime2-square.svg raster/transparent/qiime2-square-40.png 40:
svgexport vector/qiime2-square.svg raster/transparent/qiime2-square-600.png 600:
svgexport vector/qiime2-square.svg raster/transparent/qiime2-square-800.png 800:
svgexport vector/qiime2-square.svg raster/transparent/qiime2-square-1000.png 1000:

# SQUARE, TRANSPARENT, TIFF
convert raster/transparent/qiime2-square-40.png raster/transparent/qiime2-square-40.tiff
convert raster/transparent/qiime2-square-100.png raster/transparent/qiime2-square-100.tiff
convert raster/transparent/qiime2-square-200.png raster/transparent/qiime2-square-200.tiff
convert raster/transparent/qiime2-square-400.png raster/transparent/qiime2-square-400.tiff
convert raster/transparent/qiime2-square-600.png raster/transparent/qiime2-square-600.tiff
convert raster/transparent/qiime2-square-800.png raster/transparent/qiime2-square-800.tiff
convert raster/transparent/qiime2-square-1000.png raster/transparent/qiime2-square-1000.tiff

# RECT, TRANSPARENT, PNG
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-400.png
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-200.png 200:
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-100.png 100:
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-600.png 600:
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-800.png 800:
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-1000.png 1000:
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-2000.png 2000:
svgexport vector/qiime2.svg raster/transparent/qiime2-rect-4000.png 4000:

# RECT, TRANSPARENT, TIFF
convert raster/transparent/qiime2-rect-100.png raster/transparent/qiime2-rect-100.tiff
convert raster/transparent/qiime2-rect-200.png raster/transparent/qiime2-rect-200.tiff
convert raster/transparent/qiime2-rect-400.png raster/transparent/qiime2-rect-400.tiff
convert raster/transparent/qiime2-rect-600.png raster/transparent/qiime2-rect-600.tiff
convert raster/transparent/qiime2-rect-800.png raster/transparent/qiime2-rect-800.tiff
convert raster/transparent/qiime2-rect-1000.png raster/transparent/qiime2-rect-1000.tiff
convert raster/transparent/qiime2-rect-2000.png raster/transparent/qiime2-rect-2000.tiff
convert raster/transparent/qiime2-rect-4000.png raster/transparent/qiime2-rect-4000.tiff

# Q2VIEW
svgexport vector/q2view.svg raster/transparent/q2view.png 300:

# {SQUARE,RECT}, WHITE, {PNG,TIFF}
for filepath in raster/transparent/*.{png,tiff}; do
    filename=${filepath##*/}
    convert raster/transparent/$filename -background white -alpha remove raster/white/$filename
done

rm -rf $ZIP && mkdir $ZIP
cp -R raster/* $ZIP
cp vector/*.svg $ZIP
zip -r bundles/$ZIP.zip $ZIP
rm -rf $ZIP
