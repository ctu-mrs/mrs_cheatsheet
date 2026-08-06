#!/bin/bash
set -e

sudo apt update
sudo apt -y install texlive-latex-base texlive-latex-extra poppler-utils imagemagick

pdflatex -interaction=nonstopmode main.tex
pdftoppm -jpeg main.pdf thumbnail.jpg
montage *.jpg -mode Concatenate -tile 3x2 montage.jpg
convert montage.jpg -resize 1280 -quality 80 montage.jpg
mkdir -p output
mv main.pdf output/mrs_cheatsheet.pdf
mv montage.jpg output/thumbnail.jpg
