# ML Environment Setup for Fedora 42

This repository contains instructions to fully set up a Machine Learning environment based on:
- NVIDIA CUDA 12.8
- cuDNN 9.8
- TensorFlow
- Sionna 1.0.2
- JupyterLab
- Pixi (environment manager)

This environment is tested on **Fedora 42**.

---

## Prerequisites

### Step 1: Install NVIDIA Drivers

First install the NVIDIA kernel module (via `akmod`) and the CUDA driver support for Xorg:

```bash
sudo dnf5 install akmod-nvidia
```

```bash
sudo dnf5 install xorg-x11-drv-nvidia-cuda
```

Reboot after installation if necessary to ensure that the NVIDIA drivers are loaded properly.

You can check if your drivers are installed by running:

```bash
nvidia-smi
```

---

## Next Steps

- Setup Pixi and create a reproducible CUDA+ML environment
- Add Sionna and TensorFlow
- Set up Jupyter kernels linked to the environment

_(More detailed instructions coming soon.)_


## Repo Structure

```bash
README.md       # This document
pixi.toml       # Pixi environment description (to be added)
pixi.lock       # Pixi lock file (after first install)
.dir-locals.el  # If you want to use emacs for your development this
is helpful
```

---

## License

MIT License.

---

## Notes

This setup avoids installing NVIDIA's CUDA toolkit manually.
Instead, it uses NVIDIA-provided PyPI wheels that ship the needed shared libraries (*.so) automatically, making it lightweight and easy to reproduce.

