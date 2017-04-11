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


# Load git repo
git clone https://Rahul_13@bitbucket.org/rlprojectsiitm/enduro-baseline.git  factored_actions
git clone https://Rahul_13@bitbucket.org/rlprojectsiitm/baselines.git
 

# Mount for first time
# lsblk
# sudo mkfs -t ext4 /dev/xvdb
# sudo mkdir ~/ext_vol
# sudo mount /dev/xvdb ~/ext_vol
