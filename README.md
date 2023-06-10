Source to make iso for DebianEasy


Notice: This source is not complete whole source file. Some files are deleted to save space.

If you want to build iso from source, please :

1. Choose a spin (`change` is not a spin!) of iso source
2. Put `debianeasy-repo` and `firmware-edge-installer` .deb package from DebianEasy repository into `config/packages`
3. Put firmware you want to add under `config/includes.chroot/var/linu-firmware`
4. Put addtional kernel .deb packages under `config/includes.chroot/var/kernel-packages`. You can get these packages from DebianEasy repository
