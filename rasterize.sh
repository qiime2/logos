#!/usr/bin/env bash

ZIP=qiime2_logos_v4

rm -rf raster && mkdir raster

svgexport vector/qiime2-square.svg raster/qiime2-square-400.png
svgexport vector/qiime2-square.svg raster/qiime2-square-200.png 200:
svgexport vector/qiime2-square.svg raster/qiime2-square-100.png 100:
svgexport vector/qiime2-square.svg raster/qiime2-square-600.png 600:
svgexport vector/qiime2-square.svg raster/qiime2-square-800.png 800:
svgexport vector/qiime2-square.svg raster/qiime2-square-1000.png 1000:

convert raster/qiime2-square-100.png raster/qiime2-square-100.tiff
convert raster/qiime2-square-200.png raster/qiime2-square-200.tiff
convert raster/qiime2-square-400.png raster/qiime2-square-400.tiff
convert raster/qiime2-square-600.png raster/qiime2-square-600.tiff
convert raster/qiime2-square-800.png raster/qiime2-square-800.tiff
convert raster/qiime2-square-1000.png raster/qiime2-square-1000.tiff

svgexport vector/qiime2.svg raster/qiime2-rect-400.png
svgexport vector/qiime2.svg raster/qiime2-rect-200.png 200:
svgexport vector/qiime2.svg raster/qiime2-rect-100.png 100:
svgexport vector/qiime2.svg raster/qiime2-rect-600.png 600:
svgexport vector/qiime2.svg raster/qiime2-rect-800.png 800:
svgexport vector/qiime2.svg raster/qiime2-rect-1000.png 1000:

convert raster/qiime2-rect-100.png raster/qiime2-rect-100.tiff
convert raster/qiime2-rect-200.png raster/qiime2-rect-200.tiff
convert raster/qiime2-rect-400.png raster/qiime2-rect-400.tiff
convert raster/qiime2-rect-600.png raster/qiime2-rect-600.tiff
convert raster/qiime2-rect-800.png raster/qiime2-rect-800.tiff
convert raster/qiime2-rect-1000.png raster/qiime2-rect-1000.tiff

rm -rf $ZIP && mkdir $ZIP
cp raster/*.{png,tiff} $ZIP
cp vector/*.svg $ZIP
zip -r bundles/$ZIP.zip $ZIP
rm -rf $ZIP
