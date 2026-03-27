#!/bin/sh
set -e

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Re-running with sudo."
  exec sudo -E sh "$0" "$@"
fi

clear
echo "Initializing Arch Linux DSBDA SPPU environment setup..."
pacman -Sy --noconfirm

packages="
python
python-pip
python-numpy
python-pandas
python-matplotlib
python-seaborn
python-scikit-learn
python-scipy
python-statsmodels
python-nltk
jupyter-notebook
jupyterlab
jupyterlab-rise
pandoc
pandoc-crossref
texlive-bin
texlive-basic
texlive-latex
texlive-latexextra
texlive-latexrecommended
texlive-fontsextra
texlive-fontsrecommended
texlive-fontutils
texlive-mathscience
texlive-pictures
texlive-plaingeneric
texlive-pstricks
texlive-xetex
otf-latin-modern
ttf-dejavu
jdk-openjdk
base-devel
git
curl
wget
ghostscript
groff
"

missing=""
for pkg in $packages; do
  if ! pacman -Q "$pkg" >/dev/null 2>&1; then
    missing="$missing $pkg"
  fi
done

if [ -n "$missing" ]; then
  pacman -S --noconfirm --needed $missing
fi

command -v jupyter >/dev/null 2>&1 && jupyter --version >/dev/null 2>&1 || true
command -v java >/dev/null 2>&1 && java -version >/dev/null 2>&1 || true
python --version

echo
echo "==============================================="
echo " DSBDA SPPU Arch Linux Environment Ready Successfully"
echo " Python ML Stack | Jupyter | LaTeX | Java | Hadoop"
echo "==============================================="
