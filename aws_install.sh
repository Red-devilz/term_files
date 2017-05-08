# Make directories
# Install Vimrc
git clone https://github.com/Red-devilz/Vim__files.git tmp
mv tmp/vimrc2.min ~/.vimrc
mv tmp/.vim .
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm tmp -rf
vim +PluginInstall +qall

# Install require stuff
sudo apt-get update
sudp apt-get install htop screen
sudo apt-get install -y python-pip python-dev python-virtualenv ctags
sudo apt-get install -y python-opencv

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

# Tensorflow
sudo pip install pip -U
sudo pip install virtualenvwrapper
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.10.0-cp27-none-linux_x86_64.whl
sudo pip install --upgrade $TF_BINARY_URL

# ALE python interface
git clone https://github.com/mgbellemare/Arcade-Learning-Environment.git tmp
cd tmp
sudo apt-get install -y libsdl1.2-dev libsdl-gfx1.2-dev libsdl-image1.2-dev cmake
mkdir build && cd build
cmake -DUSE_SDL=ON -DUSE_RLGLUE=OFF -DBUILD_EXAMPLES=ON ..
make -j 16
cd ..
sudo -H pip install .
cd ..
rm -rf tmp

git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; bash install-deps;
./install.sh
source ~/.bashrc
cd ~

sudo apt-get install luarocks
sudo chmod 777 /home/ubuntu/.cache/luarocks/

luarocks install totem
luarocks install logroll 
luarocks install classic  
luarocks install nninit
luarocks install luaposix 33.4.0
luarocks install luasocket 
luarocks install tds
luarocks install torchx 

git clone git://github.com/Yonaba/Moses.git
luarocks install Moses/rockspec/moses-1.6.0-1.rockspec
luarocks install dpnn
luarocks install rnn

luarocks install https://raw.githubusercontent.com/lake4790k/xitari/master/xitari-0-0.rockspec
luarocks install https://raw.githubusercontent.com/Kaixhin/alewrap/master/alewrap-0-0.rockspec
luarocks install https://raw.githubusercontent.com/Kaixhin/rlenvs/master/rocks/rlenvs-scm-1.rockspec

# Mount for first time
# lsblk
# sudo mkfs -t ext4 /dev/xvdb
# sudo mkdir ~/ext_vol
# sudo mount /dev/xvdb ~/ext_vol

# Load git repo
git clone https://Rahul_13@bitbucket.org/rlprojectsiitm/enduro-baseline.git ~/ext_vol/factored_actions
git clone https://Rahul_13@bitbucket.org/rlprojectsiitm/baselines.git ~/ext_vol/baselines
