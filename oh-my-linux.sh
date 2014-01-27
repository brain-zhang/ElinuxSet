#~/bin/bash


#==================================
# on my git
#==================================
# 设置用户名密码
git config --global user.name "memorybox"
git config --global user.email memoryboxes@gmail.com 
# 全局的通过vim ~/.gitconfig来查看

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

