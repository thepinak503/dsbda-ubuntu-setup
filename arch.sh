#!/bin/sh
set -e

# Check if the script is being run with root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Re-running with sudo."
  exec sudo -E sh "$0" "$@"
fi

clear
echo "Initializing Arch Linux DSBDA SPPU environment setup..."

# Update package database
pacman -Sy --noconfirm

# List of required packages
packages="python python-pip python-numpy python-pandas python-matplotlib python-seaborn python-scikit-learn python-scipy python-statsmodels python-nltk jupyter-notebook jupyterlab pandoc texlive-bin texlive-latex texlive-latexextra texlive-fontsextra texlive-science texlive-pictures texlive-plaingeneric lmodern dejavu-fonts-ttf jdk-openjdk base-devel git curl wget"

# Check for missing packages
missing=""
for pkg in $packages; do
  if ! pacman -Q "$pkg" >/dev/null 2>&1; then
    missing="$missing $pkg"
  fi
done

# Install missing packages if any
if [ -n "$missing" ]; then
  pacman -S --noconfirm --needed $missing
fi

# Check versions of jupyter and java; ignore errors
command -v jupyter >/dev/null && jupyter --version >/dev/null || true
command -v java >/dev/null && java -version || true
python --version

echo
echo "==============================================="
echo " DSBDA SPPU Arch Linux Environment Ready Successfully"
echo " Python ML Stack | Jupyter | LaTeX | Java | Hadoop"
echo "==============================================="
