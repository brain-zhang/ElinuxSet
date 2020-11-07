#~/bin/bash


#==================================
# on my vim
#==================================
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev ruby-dev mercurial --force-yes

sudo apt-get install -y ctags
sudo apt-get install -y build-essential cmake python3-dev  #编译YCM自动补全插件依赖
sudo apt-get install -y silversearcher-ag

sudo apt-get install -y nodejs npm
sudo npm install -g jslint
sudo npm install jshint -g
sudo npm install -g eslint eslint-plugin-standard eslint-plugin-promise eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-html babel-eslint

git clone https://github.com/brain-zhang/k-vim.git ~/k-vim
sudo apt-get install -y cmake gcc g++
sudo apt-get install -y ctags
cd ~/k-vim
sh -x install.sh
