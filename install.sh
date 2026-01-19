#!/usr/bin/env bash
set -Eeuo pipefail

export DEBIAN_FRONTEND=noninteractive

if [ "$EUID" -ne 0 ]; then
  exec sudo -E bash "$0" "$@"
fi

clear
echo "Initializing Ubuntu DSBDA SPPU environment setup..."

dpkg --configure -a
apt --fix-broken install -y

apt update -y
apt upgrade -y
apt autoremove -y
apt autoclean -y

packages=(
python3 python3-venv python3-numpy python3-pandas python3-matplotlib
python3-seaborn python3-sklearn python3-scipy python3-statsmodels python3-nltk
jupyter-notebook jupyter-nbconvert jupyter-core
pandoc
texlive-xetex texlive-latex-recommended texlive-latex-extra
texlive-fonts-recommended texlive-fonts-extra
texlive-science texlive-pictures
fonts-lmodern fonts-dejavu
default-jdk hadoop
build-essential git curl wget
)

missing=()

for pkg in "${packages[@]}"; do
  dpkg -s "$pkg" &>/dev/null || missing+=("$pkg")
done

if [ "${#missing[@]}" -gt 0 ]; then
  apt install -y --no-install-recommends "${missing[@]}"
fi

command -v jupyter >/dev/null && jupyter --version >/dev/null || true
command -v java >/dev/null && java -version || true
python3 --version

echo
echo "==============================================="
echo " DSBDA SPPU Ubuntu Environment Ready Successfully"
echo " Python ML Stack | Jupyter | LaTeX | Java | Hadoop"
echo "==============================================="
echo
