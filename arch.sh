#!/usr/bin/env bash
set -Eeuo pipefail
if [ "$EUID" -ne 0 ]; then
  exec sudo -E bash "$0" "$@"
fi
clear
echo "Initializing Arch Linux DSBDA SPPU environment setup..."
pacman -Sy --noconfirm
packages=(
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
pandoc
texlive-bin
texlive-latex
texlive-latexextra
texlive-fontsextra
texlive-science
texlive-pictures
texlive-plaingeneric
lmodern
dejavu-fonts-ttf
jdk-openjdk
base-devel
git
curl
wget
)
missing=()
for pkg in "${packages[@]}"; do
  if ! pacman -Q "$pkg" &>/dev/null; then
    missing+=("$pkg")
  fi
done
if [ "${#missing[@]}" -gt 0 ]; then
  pacman -S --noconfirm --needed "${missing[@]}"
fi
command -v jupyter >/dev/null && jupyter --version >/dev/null || true
command -v java >/dev/null && java -version || true
python3 --version
echo
echo "==============================================="
echo " DSBDA SPPU Arch Linux Environment Ready Successfully"
echo " Python ML Stack | Jupyter | LaTeX | Java | Hadoop"
echo "==============================================="
