 
FROM ubuntu:18.04

#These are basically copied from `priviliged-provision.sh`

# These start an interactive prompt - I can't figure out how to fix it yet...
RUN apt-get update -y && apt-mark hold grub-common grub-pc grub-pc-bin grub2-common
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt-get install -y software-properties-common \
	python3.7 ncurses-dev bc \
	build-essential libssl-dev libffi-dev libhidapi-hidraw0 gdb \
	ninja-build python-dev pkg-config \
	git \
	cmake \
	sshpass
RUN apt-get install -y python3-pip python3-setuptools \
	# Install kernel additions for better USB device recognition
	linux-image-extra-virtual \
	sqlite3 libsqlite3-dev \
	# Documentation tools
	doxygen graphviz plantuml 
RUN apt-get install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended latexmk texlive-fonts-extra 
	# resolvconf is no longer included by default as of Ubuntu 18.04
RUN apt-get install -y resolvconf
	# kubos linux toolchains
RUN apt-get install -y minicom \
	libc6-i386 lib32stdc++6 lib32z1 \
	#build utilities
	unzip mtools


# There's something wrong with the default resolv.conf symlink. This fixes it
RUN rm -f /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Do the pip setup and installation things
RUN pip3 install wheel

# Install all Kubos python dependencies
RUN git clone https://github.com/kubos/kubos --depth 1 && \
	pip3 install -r kubos/requirements.txt && rm -r kubos

# sqlite

# Documentation tools

# KubOS Linux setup
# echo "Installing KubOS Linux Toolchains"


# iOBC Toolchain
RUN wget https://s3.amazonaws.com/kubos-world-readable-assets/iobc_toolchain.tar.gz && tar -xf /home/vagrant/iobc_toolchain.tar.gz -C /usr/bin && rm /home/vagrant/iobc_toolchain.tar.gz && echo "export PATH=$PATH:/usr/bin/iobc_toolchain/usr/bin" >> /etc/profile

# Beaglebone Black/Pumpkin MBM2 toolchain
RUN wget https://s3.amazonaws.com/kubos-world-readable-assets/bbb_toolchain.tar.gz && tar -xf /home/vagrant/bbb_toolchain.tar.gz -C /usr/bin && rm /home/vagrant/bbb_toolchain.tar.gz

# mv /home/vagrant/minirc.kubos /etc/minicom/minirc.kubos
# mv /home/vagrant/kubos-usb.rules /etc/udev/rules.d/kubos-usb.rules

# adduser vagrant dialout

# #Vagrant commands may act funny without password-less sudo
# echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# mkdir -p /home/vagrant/.kubos
# git clone https://github.com/kubos/kubos /home/vagrant/.kubos/kubos --depth 1
# chown -R vagrant /home/vagrant/.kubos

# echo "Finished root provisioning"
