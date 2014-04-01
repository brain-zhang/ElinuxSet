#~/bin/bash

SCRIPTPATH=`dirname "$0"`

#==================================
# on my git
#==================================
# 设置用户名密码
sudo yum -y install git
git config --global user.name "dev"
git config --global user.email "dev@dev.com.cn"
# 全局的通过vim ~/.gitconfig来查看

# 设置push
git config --global push.default matching

#git config user.name "Your Name"
#git config user.email you@example.com
#局部的通过当前路径下的 .git/config文件来查看

#也可以修改提交的用户名和Email：
#git commit --amend --author='Your Name <you@example.com>'

# 设置颜色
git config color.ui true
git config --global color.status auto
git config --global color.diff auto
git config --global color.branch auto
git config --global color.interactive auto

# 编辑器
git config --global core.editor vim

# 缓存密码
git config --global credential.helper cache

# 缩写
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global alias.co checkout
git config --global core.quotepath false
git config --global merge.tool kdiff3
git config --global meregtool.kdiff3.path "/usr/bin/kdiff3"
git config --global alias.visual "!gitk"


# 设置ignore
mkdir -p ~/.git
\cp -rf $SCRIPTPATH/../conf/gitignore_global ~/.git/gitignore_global
git config --global core.excludesfile ~/.git/gitignore_global


#==================================
# on my zsh
#==================================
# 安装zsh
yum -y install zsh
#sudo echo /usr/local/bin/zsh >>/etc/shells
#sudo chsh -s /usr/bin/zsh

# oh-my-zsh
sudo yum -y install curl
sudo yum -y install wget
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#==================================
# on my tmux
#==================================
# 安装tmux
sudo yum -y install tmux
\cp -rf $SCRIPTPATH/../conf/tmux_conf ~/.tmux.conf
echo alias tmux="TERM=screen-256color-bce tmux" >> ~/.zshrc


#==================================
# on my python, add python27
#==================================
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | sudo python2.7
sudo easy_install pip
pip install python-virtualenv
mkidr -p ~/.pip
echo '[global]' >> ~/.pip/pip.conf
echo 'index-url = http://pypi.douban.com/simple' >> ~/.pip/pip.conf


#==================================
# on my nodejs
#==================================
JSURL=http://nodejs.org/dist/node-latest.tar.gz
echo 'We are going to install NodeJS for you... '
echo 'lets download nodejs..'
rm -r -f /usr/local/src
mkdir -p /usr/local/src
cd /usr/local/src

wget $JSURL
tar -zxvf ./node-latest.tar.gz

echo 'Files extracted....'

cd node-v*

yum install -y openssl-devel gcc-c++ make git

echo 'Configuring and installing NodeJS'

./configure
make
make install

echo 'welllllll....... that should be it.... hopefully :)'

clear

echo "Node is now installed @ version:"
node --version

curl -k -L https://npmjs.org/install.sh | sudo sh
sudo npm install -g express
sudo npm install -g yo
sudo npm install -g bower
sudo npm install -g grunt
sudo npm install -g tldr
sudo npm install -g jshint

#==================================
# on my tools
#==================================
sudo yum -y install htop
sudo yum -y install iotop
sudo yum -y install mtr
sudo yum -y install iptraf
sudo yum -y install multitail
sudo yum -y install nethack
sudo yum -y install tig
sudo yum -y install daemon
sudo yum -y install ntpdate.x86_64
sudo curl http://beyondgrep.com/ack-2.12-single-file > /usr/local/bin/ack && chmod 0755 /usr/local/bin/ack
pip install --upgrade cdiff
