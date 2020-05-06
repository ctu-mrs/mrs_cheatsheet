#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

sudo apt -y install texlive texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra
