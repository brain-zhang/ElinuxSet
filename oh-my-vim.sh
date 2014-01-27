#~/bin/bash


#==================================
# on my vim
#==================================
#sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
#libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
#libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial --force-yes
#
#sudo apt-get remove vim vim-runtime gvim
#sudo apt-get remove vim-tiny vim-common vim-gui-common
#
#cd ~
#hg clone https://code.google.com/p/vim/
#cd vim
#./configure --with-features=huge \
#            --enable-rubyinterp \
#            --enable-pythoninterp \
#            --with-python-config-dir=/usr/lib/python2.7-config \
#            --enable-perlinterp \
#            --enable-gui=gtk2 --enable-cscope --prefix=/usr \
#            --enable-luainterp
#            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/
#make VIMRUNTIMEDIR=/usr/share/vim/vim74
#sudo make install

#git clone https://github.com/memoryboxes/k-vim.git ~/k-vim
#sudo apt-get install ctags
cd ~/k-vim
sudo sh -x install.sh
