#!/bin/sh
set -e

if [ "$(id -u)" -ne 0 ]; then
exec sudo -E sh "$0" "$@"
fi

printf "\033c"
printf "Initializing Debian/Ubuntu DSBDA + ML environment setup...\n"

export DEBIAN_FRONTEND=noninteractive

dpkg --configure -a || true
apt --fix-broken install -y || true

apt update -y
apt upgrade -y
apt autoremove -y
apt autoclean -y

packages="python3 python3-venv python3-pip build-essential default-jdk git curl wget
python3-numpy python3-pandas python3-matplotlib python3-seaborn
python3-scipy python3-sklearn python3-statsmodels python3-nltk
ipython3 python3-ipykernel jupyter-notebook jupyter-core jupyter-nbconvert
pandoc texlive-xetex texlive-latex-recommended texlive-latex-extra
texlive-fonts-recommended texlive-fonts-extra texlive-science texlive-pictures
fonts-lmodern fonts-dejavu ghostscript groff"

missing=""
for pkg in $packages; do
if ! dpkg -s "$pkg" >/dev/null 2>&1; then
missing="$missing $pkg"
fi
done

if [ -n "$missing" ]; then
apt install -y --no-install-recommends $missing
fi

if command -v jupyter >/dev/null 2>&1; then jupyter --version || true; fi
if command -v java >/dev/null 2>&1; then java -version || true; fi
python3 --version || true

printf "\n===============================================\n"
printf " DSBDA + ML Debian/Ubuntu Environment Ready Successfully\n"
printf " Python ML Stack | Jupyter | LaTeX | Java | Big-data tooling\n"
printf "===============================================\n"
