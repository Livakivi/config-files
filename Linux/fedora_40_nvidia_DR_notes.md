# NVIDIA DRIVERS
You can install nvidia drivers on Fedora with the following commands:

sudo dnf update -y # and reboot if you are not on the latest kernel
sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support

(Taken from the official rpmfusion NVIDIA page: https://rpmfusion.org/Howto/NVIDIA#Current_GeForce.2FQuadro.2FTesla)

Also, see this comment on leddit: https://old.reddit.com/r/Fedora/comments/18arb3y/how_to_install_535_nvidia_driver_on_fedora_39/kc0dy2w/
sudo vim /etc/dnf/dnf.conf and add exclude=akmod-nvidia xorg-x11-drv-nvidia* nvidia-settings  nvidia-persistenced` to it to prevent
Fedora from auto updating NVIDIA drivers and borking your system/DaVinci Resolve in the future.

# DAVINCI RESOLVE
- Download DaVinci Resolve from the official website
- run the installer with `sudo SKIP_PACKAGE_CHECK=1 ./DaVinci_Resolve_19.0b5_Linux.run` as otherwise you get a zlib missing error
- You can try running resolve with `/opt/resolve/bin/resolve %u` but you'll most likely get a `libcrypt.so.1` missing error.
- Run `sudo dnf install libxcrypt-compat libcurl libcurl-devel mesa-libGLU` to install dependencies
  
Then remove the wrong libraries DR tries to use:
```
cd /opt/resolve/libs
sudo mkdir disabled-libraries
sudo mv libglib* disabled-libraries
sudo mv libgio* disabled-libraries
sudo mv libgmodule* disabled-libraries
```

 This repo will most likely have up to date info: https://github.com/H3rz3n/Davinci-Resolve-Fedora-38-39-40-Fix
