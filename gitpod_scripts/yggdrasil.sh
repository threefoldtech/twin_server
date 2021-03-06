set -ex 
export DUMB_INIT_VERSION=1.2.2
export YGGDRASIL_VERSION=0.3.15

apt install golang -y

git clone "https://github.com/yggdrasil-network/yggdrasil-go.git" /tmp/yggdrasil
pushd /tmp/yggdrasil

# git reset --hard v${YGGDRASIL_VERSION}
./build
sudo cp yggdrasil* /usr/bin/
popd
# curl -sSfLo /tmp/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64"

# chmod 0755 /tmp/dumb-init


mkdir -p /var/log/yggdrasil


yggdrasil -genconf > /etc/yggdrasil.conf


# sudo yggdrasil -useconffile /etc/yggdrasil.conf