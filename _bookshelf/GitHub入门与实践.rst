---
title: GitHub入门与实践
date: 2018-10-04
categories: 计算
tags: [工具, Git, 基础]
excerpt_separator: .. 摘要注释

---
.. container:: summary

    就如同\ `GitHub <https://github.com/>`_\ 不止是\ *Git*\ 仓库托管服务一般，本书的要点也不止是\ *Git*\ 命令的使用。

.. 摘要注释

作者以“改善开发流程”为主旨，从“社会化编程”的角度，讲述了\ *GitHub*\ 的使用方法：1、发起、接收\ *Pull Request*\；2、Issue、持续集成、代码覆盖；3、以\ **部署**\ 为中心、以\ **发布**\ 为中心的\ *Git Flow*\ 。

文摘
----

.. compound::

    针对不特定的多数人
        ❶ 在 GitHub 上进行 Fork

        ❷ 将❶的仓库 clone 至本地开发环境

        ❸ 在本地环境中创建特性分支

        ❹ 对特性分支进行代码修改并进行提交

        ❺ 将特性分支 push 到❶的仓库中

        ❻ 在 GitHub 上对 Fork 来源仓库发送 Pull Request

    以部署为中心
        ❶ 令 master 分支时常保持可以部署的状态

        ❷ 进行新的作业时要从 master 分支创建新分支，新分支名称要具有描述性

        ❸ 在❷新建的本地仓库分支中进行提交

        ❹ 在 GitHub 端仓库创建同名分支，定期 push

        ❺ 需要帮助或反馈时创建 Pull Request，以 Pull Request 进行交流

        ❻ 让其他开发者进行审查，确认作业完成后与 master 分支合并

        ❼ 与 master 分支合并后立刻部署

    以发布为中心
        ❶ 从开发版的分支（develop）创建工作分支（feature branches），进行功能的实现或修正

        ❷ 工作分支（feature branches）的修改结束后，与开发版的分支（develop）进行合并

        ❸ 重复上述❶和❷，不断实现功能直至可以发布

        ❹ 创建用于发布的分支（release branches），处理发布的各项工作

        ❺ 发布工作完成后与 master 分支合并，打上版本标签（Tag）进行发布

        ❻ 如果发布的软件出现 BUG，以打了标签的版本为基础进行修正（hotfixes）

.. footer::

    工具只能解决工具的问题，版本控制也只是开发过程中的一环，而人的问题还是需要人来解决。
