#!/bin/bash
set -e
sudo apt update && sudo apt install -y \
python3 python3-pip python3-venv \
python3-numpy python3-pandas python3-matplotlib \
python3-seaborn python3-sklearn python3-scipy python3-statsmodels python3-nltk \
jupyter-notebook jupyter-nbconvert jupyter-core \
pandoc \
texlive-xetex \
texlive-latex-recommended texlive-latex-extra \
texlive-fonts-recommended texlive-fonts-extra \
texlive-science texlive-pictures \
fonts-lmodern fonts-dejavu \
default-jdk hadoop \
build-essential git curl wget

echo "DSBDA SPPU Ubuntu environment ready ✅"
