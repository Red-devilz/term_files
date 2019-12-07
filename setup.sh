# Update
sudo pacman -Syyu

# Install packages
sudo pacman -S neovim
sudo pacman -S python-pynvim
sudo pacman -S gnupg git rng-tools
sudo pacman -S keepassxc
sudo pacman -S neofetch
sudo pacman -S okular zathura
sudo pacman -S zsh tmux
sudo pacman -S xclip xsel
sudo pacman -S rsync python2
sudo pacman -S rofi
sudo pacman -S polybar breeze 
sudo pacman -S arc-gtk-theme

pamac build la-capitaine-icon-theme
pamac build numix-icon-theme

sudo pip3 install virtualenvwrapper
wget https://bootstrap.pypa.io/get-pip.py
sudo python2 get-pip.py
rm get-pip.py
sudo pip3 install python-nvim
sudo pip2 install python-nvim

sudo pacman -S edex-ui zathura

# Restart to install snapd
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap


# XFCE settgins
# 1) Change Super + x - close window
# 2) Change Super + d - Show desktop


### Terminal Setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fonts/themes
https://github.com/ryanoasis/nerd-fonts
https://github.com/powerline/fonts
https://github.com/edipox/n1-ido
https://github.com/vifo/xfce4-terminal-colorschemes
https://github.com/arcticicestudio/nord-xfce-terminal
https://github.com/addy-dclxvi/Xfwm4-Theme-Collections ~/.themes
https://github.com/EliverLara/Nordic.git

# soft link files from below
git clone https://github.com/rahul13ramesh/term_files
git clone https://github.com/rahul13ramesh/Vim__files
cd ~/Documents/personal/
git clone https://github.com/rahul13ramesh/wikinotes


### Coding setup
pamac build visual-studio-code
sudo pip3 install papis


$ Applications
pamac build spotify



sudo snap install slack --classic
sudo snap install mailspring


# TODO
# Rescuetime
