#!/bin/sh
set -e

if [ "$(id -u)" -ne 0 ]; then
exec sudo -E sh "$0" "$@"
fi

printf "\033c"
printf "Initializing Arch Linux DSBDA + ML environment setup...\n"

pacman -Syyu --noconfirm

packages="python python-pip base-devel jdk-openjdk git curl wget ghostscript groff
python-numpy python-pandas python-matplotlib python-seaborn
python-scipy scikit-learn python-statsmodels python-nltk
ipython jupyter-notebook jupyterlab jupyterlab-rise
pandoc pandoc-crossref
texlive-core texlive-latexextra texlive-fontsextra texlive-mathscience texlive-pictures
otf-latin-modern ttf-dejavu"

missing=""
for pkg in $packages; do
if ! pacman -Q "$pkg" >/dev/null 2>&1; then
missing="$missing $pkg"
fi
done

if [ -n "$missing" ]; then
pacman -S --noconfirm --needed $missing
fi

if command -v jupyter >/dev/null 2>&1; then jupyter --version || true; fi
if command -v java >/dev/null 2>&1; then java -version || true; fi
python --version || true

printf "\n===============================================\n"
printf " DSBDA + ML Arch Linux Environment Ready Successfully\n"
printf " Python ML Stack | Jupyter | LaTeX | Java | Big-data tooling\n"
printf "===============================================\n"
