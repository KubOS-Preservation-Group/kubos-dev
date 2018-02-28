kubos update --latest || true #Can't run as root or else yotta symlinks are created to /root/.kubos/...

# Install rust stuff
# We do this as vagrant because it
# installs to $HOME/
# Rust toolchain + Cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y
echo 'export PATH=$PATH:"~/.cargo/bin"' >> /home/vagrant/.bashrc
# bbb/mbm2 target
/home/vagrant/.cargo/bin/rustup target install arm-unknown-linux-gnueabihf
# iobc target
/home/vagrant/.cargo/bin/rustup target install armv5te-unknown-linux-gnueabi
# install cargo-kubos
/home/vagrant/.cargo/bin/cargo install --git https://github.com/kubos/cargo-kubos
# setup cargo config
mv /home/vagrant/cargo_config /home/vagrant/.cargo/config

kubos update --tab-completion

echo "source /home/vagrant/.kubos/completion/kubos_completion" >> /home/vagrant/.bashrc

echo "Finishing provisioning..."
