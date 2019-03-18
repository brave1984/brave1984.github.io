---
title: 第一本Docker书
date: 2019-03-13 19:10:11 +0800
categories: 计算
tags: [Docker, 集群, 基础]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    \ Docker_\ 的容颜——\ **CLI**\ 接口——竟然可以这么美！

.. _Docker: https://www.docker.com/

.. 摘要注释

作为一本名副其实的\ Docker_\ 入门书，它的主要内容是命令行接口的使用、镜像的构建、单主机网络中多容器应用栈的构建与部署。只要熟悉\ GNU_/Linux_\ 命令行，你就能快速地入门。

\ Docker_\ 的命令行接口通过\ ``REST API``\ 与守护进程进行交互，守护进程创建并管理\ Docker_\ 对象，如：镜像、容器、网络与存储卷。

.. image:: https://docs.docker.com/engine/images/engine-components-flow.png
    :alt: Docker Engine Components Flow

镜像是由联合文件系统以“栈”的形式堆叠加载的。在\ **写时复制**\ 的模式下，容器内的镜像层是只读的，镜像栈的顶端是个读写层。与\ Dockerfile_\ 、\ docker-compose.yml_\ 关联的两种\ *DSL*\ ，使服务的构建与部署变得更为容易，实现了“一次构建，随处运行”。

用\ `Docker in Docker`_\ 搭建\ *CI*\ 的实现是不够优雅的\ [#]_\ ，应当将\ Docker_\ 的套接字文件挂载到提供\ *CI*\ 的容器上。基于\ Jenkins_\ 的\ *CI*\ ，可以采用\ `Blue Ocean`_\ 镜像。还可以采用\ Drone_\ ，容器管理平台可采用\ Portainer_\ 。

书中的\ Swarm_\ 集群编排示例已经过时，从\ *Engine API version* 1.12 开始，\ Swarm_\ 被整合进了\ Docker_ *Engine*\ 中，并且不再需要集成额外的“服务发现”了。

.. [#] http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/

.. footer::

    带着对\ **存储卷**\ 、\ **网络**\ 、\ **用户**\ 等概念的疑惑，去阅读《\ `Docker 实战`_\ 》吧！

.. _GNU: http://www.gnu.org/
.. _Linux: https://www.kernel.org/
.. _Dockerfile: https://docs.docker.com/engine/reference/builder/
.. _docker-compose.yml: https://docs.docker.com/compose/compose-file/
.. _`Docker in Docker`: https://hub.docker.com/_/docker/
.. _Jenkins: https://jenkins.io/
.. _`Blue Ocean`: https://hub.docker.com/r/jenkinsci/blueocean
.. _Drone: https://drone.io/
.. _Portainer: https://www.portainer.io/
.. _Swarm: https://docs.docker.com/swarm/overview/
.. _`Docker 实战`: /bookshelf/Docker实战/
