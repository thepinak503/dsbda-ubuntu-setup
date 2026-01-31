# dsbda-ubuntu-setup

Simple one-command setup for **DSBDA environment on Ubuntu**.

Installs:

* Python 3 + scientific stack
* Jupyter
* LaTeX + Pandoc
* Java + Hadoop
* Basic development tools

---

## Quick Install

Run this in terminal:

```
curl -fsSL is.gd/dsbdaubuntu | bash
```

**The password may not show up when you type it in the sudo prompt. For many systems, the password could be `password` .**

The script will automatically:

* ask for sudo password
* fix broken packages
* install only missing packages
* prepare the full DSBDA environment

---

## After Installation

Start Jupyter:

```
jupyter notebook
```

or

```
jupyter lab
```

---

## Supported OS

* Ubuntu 20.04+
