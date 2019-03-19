---
title: Docker实战
date: 2019-03-18 19:32:44 +0800
categories: 计算
tags: [Docker, 集群, 基础]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    只有理解\ **隔离**\ ，才能知其然又知其所以然。

.. 摘要注释

个人认为全书的精华就是容器的资源隔离与权限控制等基础原理的介绍，只有了解了这些概念，才能更好地构建与部署多容器应用栈。

文摘
----

隔离是众多计算模式、资源管理策略和一般审计实践的一个核心概念。容器提供的是进程上下文的隔离，而不是整个系统的虚拟化。

.. compound::

    \ Docker_\ 构建的容器隔离包括8个方面：

    - *PID命名空间*——进程标识符和能力
    - *UTS命名空间*——主机名和域名
    - *MNT命名空间*——文件系统访问和结构
    - *IPC命名空间*——通过共享内存的进程间通信
    - *NET命名空间*——网络访问和结构
    - *USR命名空间*——用户名和标识
    - *chroot()*——控制文件系统根目录的位置
    - *cgroups*——资源保护

容器有四种状态：正在运行、暂停、重新启动或退出。

.. figure:: https://docs.docker.com/storage/images/types-of-mounts-volume.png

    每一个存储卷就是容器目录树的挂载点在主机目录树中的位置，存储卷有两种类型：绑定挂载存储卷、管理存储卷。

.. figure:: /assets/bookshelf/{{ page.title }}/network.jpg

    有四种网络容器原型：\ **Closed**\ 容器、\ **Bridged**\ 容器、\ **Joined**\ 容器、\ **Open**\ 容器。\ **Joined**\ 容器共享私有接口与本地回环接口。

\ `链接`_\ 的本质就是静态的、具有方向性和无传递性的依赖。链接通过检测目的容器的网络信息（IP地址和开放端口），然后将这些信息注入新容器中。容器只有在运行状态，才能维持IP地址的租约。

.. compound::

    为新容器添加一条\ `链接`_\ 会发生以下三件事：

    - 描述目标容器的环境变量会被创建；
    - 链接的别名和对应的目标容器的IP地址会被添加到DNS覆盖列表中；
    - 如果跨容器通信被禁止了，\ Docker_\ 会添加特定的防火墙规则来允许被链接的容器间的通信。

.. footer::

    关于\ `Swarm mode`_\ 的学习，可参考《\ `Swarm容器编排与Docker原生集群`_\》。技术书籍，尤其是中文书籍总是落后于文档。


    Dockerfile links: `ubuntu <https://github.com/tianon/docker-brew-ubuntu-core/blob/bfd753a747344ff1c6838a2c91ff0606e936f0d0/bionic/Dockerfile>`_, `nginx <https://github.com/nginxinc/docker-nginx/blob/7890fc2342613e6669ad83ceead9c81136d2cc0a/mainline/stretch/Dockerfile>`_, `postgres <https://github.com/docker-library/postgres/blob/7e80419825e4bab4e749bc61334570ffc261ea5e/11/Dockerfile>`_, `python <https://github.com/docker-library/python/blob/9bb5d46dbcf16250a2d292ddc1e0b7a792aa275f/3.7/stretch/Dockerfile>`_, `ruby <https://github.com/docker-library/ruby/blob/995719add69339b78bd8cde46183b4902b761add/2.6/stretch/Dockerfile>`_.

.. _`链接`: https://docs.docker.com/network/links/
.. _Docker: https://www.docker.com/
.. _`Swarm mode`: https://docs.docker.com/engine/swarm/
.. _`Swarm容器编排与Docker原生集群`: https://amzn.to/2CszJ7I
