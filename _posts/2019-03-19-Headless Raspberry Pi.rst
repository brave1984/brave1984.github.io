---
title: Headless Raspberry Pi
date: 2019-03-19 15:17:17 +0800
categories: 计算
tags: [树莓派]
gist: 96ce0dc978a8deacaf7e9d26a195c7fc
excerpt_separator: .. 摘要注释

---
.. container:: summary

    \ **萌新**\ ：如何配置“无头”\ `树莓派`_\ 呀？

    \ **休闲玩家**\ ：照官方文档配呗……

.. _`树莓派`: https://www.raspberrypi.org/

.. 摘要注释

烧录镜像
--------

在\ Raspbian_\ 操作系统的下载页面下载\ *Raspbian Stretch Lite*\ 镜像，使用\ Etcher_\ 烧录镜像。

镜像烧录好后，SD卡被挂载在主机目录树中\ ``/media/pi``\ 的位置，并被分成了两个分区：引导文件系统\ *boot*\ 、根文件系统\ *rootfs*\ 。

配置文件
--------

用\ ``sudo su``\ 命令，将主机用户切换成\ *root*\ 用户；

SSH
~~~

#. 在\ *boot*\ 分区的根目录下，创建一个名为\ *ssh*\ 的空白文件\ [#]_\ ；
#. 用\ ``ssh-keygen``\ 命令创建一个SSH KEY\ [#]_\ ；
#. 在\ *rootfs*\ 分区的\ ``home/pi``\ 目录下，新建一个名为\ *.ssh*\ 的目录\ [#]_\ ；
#. 将SSH KEY的公钥\ *id_rsa.pub*\ 写入\ *.ssh*\ 目录下的\ *authorized_keys*\ 文件中；
#. 用\ ``sed``\ 命令，修改\ *rootfs*\ 分区中\ *etc/ssh*\ 目录下的\ *sshd_config*\ 文件中的认证信息。

.. include:: gists/{{ page.gist }}/Headless.sh
    :code: bash
    :start-line: 0
    :end-line: 11

Wi-Fi
~~~~~

#. \ ``wpa_passphrase``\ 命令，接受两个参数：\ ``ssid``\ 、\ ``passphrase``\ ，用于生成Wi-Fi连接信息\ [#]_\ ；
#. 用\ ``sed``\ 命令在连接信息中添加两个字段：国名、搜寻隐藏网络；
#. 将连接信息追加到\ *rootfs*\ 分区中\ ``etc/wpa_supplicant``\ 目录下的\ ``wpa_supplicant.conf``\ 文件中。

.. include:: gists/{{ page.gist }}/Headless.sh
    :code: bash
    :start-line: 12
    :end-line: 14

静态IP
~~~~~~

#. 登录路由器的管理界面，查看LAN口IP参数：IP地址与子网掩码；
#. \ ``ip_address``\ 的值为：\ `树莓派`_\ 的静态IP地址/子网掩码位数，\ ``routers``\ 与\ ``domain_name_servers``\ 的值为LAN口IP地址；
#. 修改\ *rootfs*\ 分区中\ ``etc``\ 目录下的\ ``dhcpcd.conf``\ 文件\ [#]_\ 。

.. include:: gists/{{ page.gist }}/Headless.sh
    :code: bash
    :start-line: 15
    :end-line: 22

hostname与locale
~~~~~~~~~~~~~~~~

#. 在\ *rootfs*\ 分区中\ ``etc``\ 目录下的\ ``hostname``\ 、\ ``hosts``\ 文件中，写入\ `树莓派`_\ 的新主机名；
#. 将环境变量\ ``$LC_ALL``\ 添加到\ *rootfs*\ 分区中\ ``home/pi``\ 目录下的\ ``.bashrc``\ 文件中。

.. include:: gists/{{ page.gist }}/Headless.sh
    :code: bash
    :start-line: 23
    :end-line: 28

搭建集群
--------

#. \ `Docker Machine`_\ 无法识别\ `树莓派`_\ 的操作系统，需挨个安装\ Docker_\ ；
#. 参照\ Swarm_\ 示例\ [#]_\ ，编排容器集群。

.. image:: /assets/posts/raspberrypi.jpg

.. footer:: 

    .. [#] https://www.raspberrypi.org/documentation/remote-access/ssh/README.md
    .. [#] https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
    .. [#] https://www.raspberrypi.org/documentation/configuration/security.md
    .. [#] https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md
    .. [#] https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md
    .. [#] https://docs.docker.com/engine/swarm/swarm-tutorial/

.. _Raspbian: https://www.raspberrypi.org/downloads/raspbian/
.. _Etcher: https://github.com/balena-io/etcher
.. _`Docker Machine`: https://docs.docker.com/machine/overview/
.. _Docker: https://www.docker.com/
.. _Swarm: https://docs.docker.com/engine/swarm/
.. _balena: https://www.balena.io/
