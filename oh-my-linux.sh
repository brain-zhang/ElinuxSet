#~/bin/bash


#==================================
# on my git
#==================================
# 设置用户名密码
git config --global user.name "memorybox"
git config --global user.email memoryboxes@gmail.com 
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
\cp -rf conf/gitignore_global ~/.git/gitignore_global
git config --global core.excludesfile ~/.git/gitignore_global


#==================================
# on my zsh
#==================================
# 安装zsh
sudo apt-get install zsh --force-yes
#sudo echo /usr/local/bin/zsh >>/etc/shells
sudo chsh -s /usr/bin/zsh

# oh-my-zsh
sudo apt-get install curl --force-yes
sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

#==================================
# on my tmux
#==================================
# 安装tmux
sudo apt-get install tmux --force-yes
\cp -rf conf/tmux_conf ~/.tmux.conf


#==================================
# on my python
#==================================
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | sudo python
easy_install pip

#==================================
# on my subversion
#==================================
sudo echo deb http://ppa.launchpad.net/svn/ppa/ubuntu precise main >>/etc/apt/sources.list
sudo echo deb-src http://ppa.launchpad.net/svn/ppa/ubuntu precise main >>/etc/apt/sources.list
sudo apt-get update
sudo sudo apt-get install subversion

#==================================
# on my nodejs
#==================================
sudo apt-get install python-software-properties python g++ make --force-yes
sudo add-apt-repository ppa:chris-lea/node.js --force-yes
sudo apt-get update --force-yes
sudo apt-get install nodejs --force-yes

curl -k https://npmjs.org/install.sh | sudo sh
sudo npm install -g express
sudo npm install -g yo
sudo npm install -g bower
sudo npm install -g grunt

#==================================
# on my tools
#==================================
sudo apt-get install htop --force-yes
sudo apt-get install iotop --force-yes
sudo apt-get install mtr --force-yes
sudo apt-get install iptraf --force-yes
sudo apt-get install multitail --force-yes
sudo apt-get install nethack --force-yes
curl http://beyondgrep.com/ack-2.12-single-file > /usr/bin/ack && chmod 0755 !#:3

