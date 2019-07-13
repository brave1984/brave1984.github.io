---
title: 深入浅出Docker
date: 2019-06-30 08:49:34 +0800
categories: 计算
tags: [Docker, 工具]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    Docker_\ 容器是由各种命名空间组合而成的。

.. _Docker: https://www.docker.com/

.. 摘要注释

相较于其它的\ Docker_\ 书，本书涵盖了\ *多阶段构建*\ 、\ swarm_\ 、\ overlay_\ 、\ service_\ 、\ stack_\ 等内容。作为一本\ **DCA考试**\ 的参考图书，它还涵盖有\ *企业级*\ 的内容，与\ Docker_\ 使用相关的重要的概念都被作者讲解清楚了。

\ swarm_\ 、\ overlay_\ 、\ service_\ 、\ stack_\ 是一个有机的整体，它致力于多主机网络中应用的部署。\ swarm_\ 用于集群编排与任务调度；\ overlay_\ 提供了容器间通信所需的网络；\ service_\ 用于配置容器的属性；\ stack_\ 采用\ `Compose file`_\ 形式描述多服务应用。

.. _swarm: https://docs.docker.com/engine/swarm/
.. _overlay: https://docs.docker.com/network/overlay/
.. _service: https://docs.docker.com/engine/swarm/how-swarm-mode-works/services/
.. _stack: https://docs.docker.com/engine/swarm/stack-deploy/
.. _`Compose file`: https://docs.docker.com/compose/compose-file/
