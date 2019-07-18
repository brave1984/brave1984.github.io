---
title: 奔跑吧Ansible
date: 2019-06-26 10:09:08 +0800
categories: 计算
tags: [Ansible, Python, 工具]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    幂等性、\ **DSL**\ 、观察者模式、内置模块、可复用……

.. 摘要注释

本书对\ Ansible_ 2的用法进行了比较全面的讲解，再结合文档，读者就能深入理解\ Ansible_\ 了。

Ansible_\ 采用观察者模式，控制主机是可被观察者，远程主机是观察者。远程主机只需支持\ *SSH*\ 与\ Python_\ 即可，控制主机通过inventory来管理远程主机。远程主机可被归类为不同的群组，一个群组又可以从属于其他群组。

playbook使用声明式的\ **DSL**\ （含有条件、循环结构）定义，用\ YAML_\ 语法表示。\ Ansible_\ 集成了\ Jinja2_\ 模板引擎，除了自身提供的过滤器外，还允许用户自定义过滤器。在可重用方面，playbook不但可以\ ``include``\ 或\ ``import``\ 任务文件，还可拆分成\ ``role``\ 。

Ansible_\ 最突出的特性是\ **幂等性**\ （同一个操作被执行一次与执行多次是等效的），只需要运行playbook一次就可以将每台服务器都置为期望的状态。使用\ *command*\ 与\ *shell*\ 模块时，也应当保证操作是幂等的。用户可以自定义模块，但每一个模块都应当是幂等的。

Ansible_\ 提供了多种部署策略，还可执行异步任务，有多种回调插件可选。在\ Docker_\ 的使用方面，我个人认为\ Docker_\ 的归\ Docker_\ ，\ Ansible_\ 的归\ Ansible_\ ，\ Ansible_\ 没必要接管镜像与应用栈的定义。

文摘
----

playbook包括一个或多个play，一个play由一组无序的主机（host）和一系列有序的task组成，每个task仅由一个模块构成。任何task运行的时候都有潜在可能以某种方式改变主机的状态，\ Ansible_\ 模块首先会在采取任何行动之前检查主机的状态是否需要改变。

只有在所有task执行完后，handler才会执行。哪怕被通知了多次，它也只执行一次。当play中定义了多个handler时，handler按照play中定义的顺序执行，而不是通知的顺序。handler唯一常见的用途是重启服务和重启机器。

Ansible_\ 会在名为\ ``host_vars``\ 的目录中寻找主机变量文件，在名为\ ``group_vars``\ 的目录中寻找组变量文件。在\ Ansible_\ 中，变量的作用域载体为主机，只有针对特定主机讨论变量的值才有意义。

.. compound::
    调用模块时，\ Ansible_\ 会执行如下操作：

    - 生成带有参数的独立\ Python_\ 脚本（只限于\ Python_\ 模块）
    - 将模块复制到服务器
    - 在服务器上创建一个参数文件（只限于非\ Python_\ 模块）
    - 在服务器上，以参数文件作为参数调用模块
    - 解析模块的标准输出

.. footer::

    If Ansible modules are the tools in your workshop, playbooks are your instruction manuals, and your inventory of hosts are your raw material.

    - `Working with Inventory <http://docs.ansible.com/ansible/intro_inventory.html>`_
    - `Working With Playbooks <http://docs.ansible.com/ansible/playbooks.html>`_
    - `Module Index <http://docs.ansible.com/ansible/modules_by_category.html>`_
    - `Filters <https://docs.ansible.com/ansible/latest/user_guide/playbooks_filters.html>`_

.. _Ansible: https://docs.ansible.com/
.. _Python: https://www.python.org/
.. _YAML: https://yaml.org/
.. _Jinja2: http://jinja.pocoo.org/docs/
.. _Docker: https://www.docker.com/
