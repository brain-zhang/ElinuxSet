来自:

https://github.com/luyg24/IT_security/blob/master/centos_security.txt

## centos6安全加固

#### 首先需要更新一些软件

* bash
* openssl
* glic

#### 配置口令不允许重复次数和口令复杂度

    vim /etc/pam.d/system-auth

找到

    password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok

该行，在行后面添加  `remember=5`  代表不允许使用之前5次用过的密码

修改效果:

    password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5

找到`password    requisite     pam_cracklib.so`行

修改为：

    password    requisite     pam_cracklib.so try_first_pass retry=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1

解释：设置密码最大重试3次，并且密码中必须至少包含1个大写，1个小写，1个数字，一个特殊字符

注意：root用户不受此限制，普通用户需要用登陆后改密码才受限。

#### 禁止root登陆

    vim  /etc/ssh/sshd_config

找到"#PermitRootLogin yes" 修改为 PermitRootLogin no

注意：修改完重启下ssh服务:

    service sshd restart

#### 修改口令长度和过期时间

    vim /etc/login.defs

修改如下内容

    PASS_MAX_DAYS   90
    PASS_MIN_DAYS   1
    PASS_MIN_LEN    9
    PASS_WARN_AGE   7

解释：

    #       PASS_MAX_DAYS   Maximum number of days a password may be used.
    #       PASS_MIN_DAYS   Minimum number of days allowed between password changes.
    #       PASS_MIN_LEN    Minimum acceptable password length.
    #       PASS_WARN_AGE   Number of days warning given before a password expires.

#### 设置连续认证失败次数,并设置失败锁定时间

修改两个文件(/etc/pam.d/system-auth和/etc/pam.d/sshd)，分别在两个文件的开始位置加入

    auth        required    pam_tally2.so    deny=6    unlock_time=300 even_deny_root root_unlock_time=120

解释：设置最大失败次数为6次，如果超过6次则锁定300s，root用户锁定120s

注意：如果这两个文件中有"required pam_tally2.so deny"这句的话需要删掉

#### umask 降权,设置历史命令个数

默认uid>199的 umask为002  也就是普通用户创建出来的文件权限是775

uid<199的umask 为022 也就是root之类用户创建出来的权限是755

这里需要修改/etc/profile 修改为027

直接在该文件下新增一行 "umask 027" 即可.

修改HISTSIZE=10 设置最大历史命令设置为10

#### 修改ssh banner

首先创建个自定义banner文件

echo "only authorized user can login" > /etc/ssh/mybanner

修改配置文件/etc/ssh/sshd_config,在其中新增"Banner /etc/ssh/mybanner"

注意：修改完重启ssh服务

#### 修改ssh访问控制

修改/etc/hosts.allow 文件，在其中加入可以访问该机器的地址

例如：

sshd:10.35.0.0/255.255.0.0    #允许10.35.0.0段的所有主机访问

修改/etc/hosts.deny文件，在其中加入的机器是禁止访问的

sshd:all     #这里禁止所有

注意：hosts.allow文件优先

#### 设置空闲超时退出

修改/etc/profile文件，在文件底部追加

    TMOUT=300    #设置空闲退出时间为300s

#### su限制

修改/etc/login.defs 文件，追加"SU_WHEEL_ONLY yes"

修改/etc/pam.d/su文件，将"auth            required        pam_wheel.so use_uid"前面的#去掉即可

然后将要配置有su权限的用户加入到wheel组

    usermod -G wheel work

以后work用户执行命令需要  sudo xxx 就俱备了root的权限了

#### 取消CTRL+ALT+DELETE

修改/etc/init/control-alt-delete.conf

将如下两句话注释掉即可

    start on control-alt-delete
    exec /sbin/shutdown -r now "Control-Alt-Delete pressed"

针对centos7

    rm -rf /usr/lib/systemd/system/ctrl-alt-del.target

即可


#### 修改motd,用于登陆系统后的提示信息。

    echo "Illegal users are not allowed to login, Only authorized users can login" >/etc/motd

当用显示器连接linux主机的时候，屏幕会显示系统版本等相关信息，可以将他取消掉，将/etc/issue和/etc/issue.net改名即可

#### 禁用不用的用户和组

    vim /etc/passwd

    #adm:x:3:4:adm:/var/adm:/sbin/nologin
    #lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
    #sync:x:5:0:sync:/sbin:/bin/sync
    #shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
    #halt:x:7:0:halt:/sbin:/sbin/halt
    #uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
    #operator:x:11:0:operator:/root:/sbin/nologin
    #games:x:12:100:games:/usr/games:/sbin/nologin
    #gopher:x:13:30:gopher:/var/gopher:/sbin/nologin

    vim /etc/group

    #adm:x:4:root,adm,daemon
    #lp:x:7:daemon,lp
    #uucp:x:14:uucp
    #games:x:20:
    #dip:x:40:

#### 禁用不必要的服务

    chkconfig acpid off
    chkconfig anacron off
    chkconfig auditd off
    chkconfig avahi-daemon off
    chkconfig autofs off
    chkconfig atd off
    chkconfig bluetooth off
    chkconfig cpuspeed off
    chkconfig cups off
    chkconfig firstboot off
    chkconfig gpm off
    chkconfig haldaemon off
    chkconfig hidd off
    chkconfig ip6tables off
    chkconfig iptables off
    chkconfig lvm2-monitor off
    chkconfig mcstrans off
    chkconfig mdmonitor off
    chkconfig messagebus off
    chkconfig nfslock off
    chkconfig pcscd off
    chkconfig rawdevices off
    chkconfig readahead_early off
    chkconfig restorecond off
    chkconfig rpcidmapd off
    chkconfig sendmail off
    chkconfig xfs off
    chkconfig yum-updatesd off
    chkconfig NetworkManager off
