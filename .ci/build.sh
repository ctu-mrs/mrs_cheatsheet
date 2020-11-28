#!/bin/bash
set -e

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

sudo apt -y update
sudo apt -y install texlive-latex-base texlive-latex-extra poppler-utils imagemagick

pdflatex -interaction=nonstopmode main.tex
pdftoppm -jpeg main.pdf thumbnail.jpg
montage *.jpg -mode Concatenate -tile 3x2 montage.jpg
convert montage.jpg -resize 1280 -quality 80 montage.jpg
mkdir -p output
mv main.pdf output/mrs_cheatsheet.pdf
mv montage.jpg output/thumbnail.jpg
