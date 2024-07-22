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
todo
