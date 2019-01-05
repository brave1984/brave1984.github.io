---
title: GitHub入门与实践
date: 2018-10-04
categories: 计算
tags: [Git, 基础, 工具]
excerpt_separator: .. 摘要注释
---

.. class:: excerpt

    讲述了GitHub的从个人使用到团队开发

.. 摘要注释

----

文摘
----

.. role:: bash(code)
    :language: bash

设置账户
~~~~~~~~
#. :bash:`git config --global user.name "username"`
#. :bash:`git config --global user.email "email@example.com"`
#. :bash:`cat ~/.gitconfig`
#. :bash:`ssh-keygen -t rsa -C "email@example.com"`
#. :bash:`cat ~/.ssh/id_rsa.pub`
#. 在\ *GitHub*\ 上添加公钥
#. :bash:`ssh -T git@github.com`

发送Pull Request
~~~~~~~~~~~~~~~~

.. image:: /bookshelf/{{ page.title }}/6-1.png
    :alt: send pull request

❶ 在 GitHub 上进行 Fork

❷ 将❶的仓库 clone 至本地开发环境

❸ 在本地环境中创建特性分支

❹ 对特性分支进行代码修改并进行提交

❺ 将特性分支 push 到❶的仓库中

❻ 在 GitHub 上对 Fork 来源仓库发送 Pull Request

.. image:: /bookshelf/{{ page.title }}/6-2.png
    :alt: fetch

接收Pull Request
~~~~~~~~~~~~~~~~

.. image:: /bookshelf/{{ page.title }}/7-1.png
    :alt: clone & fetch

.. image:: /bookshelf/{{ page.title }}/7-2.png
    :alt: checkout & merge

.. image:: /bookshelf/{{ page.title }}/7-3.png
    :alt: merge pull request

Travis CI
~~~~~~~~~

#. :bash:`gem install travis`
#. :bash:`vi .travis.yml`
#. :bash:`travis login`

