---
title: VIM and Python
date: 2019-01-02 09:11:25 +0800
categories: 计算
tags:  [Python, VIM, 工具]
excerpt_separator: .. 摘要注释
---
.. _VIM: https://www.vim.org/

.. class:: excerpt

    团长： 萌新，赶紧把这个\ *Python*\ 脚本给我改好。

    萌新： 好的，先等我把打开\ *Pycharm*\ 。

    休闲玩家： 你就不能用\ VIM_\ ？

.. 摘要注释

----

安装插件
--------

利用\ VIM_\  8的原生包管理功能，从\ `GitHub <https://github.com/>`_\ 上克隆以下插件到\ *~/.vim/pack/foo/start*\目录：

* `Python-mode <https://github.com/python-mode/python-mode>`_
* `NERDTree <https://github.com/scrooloose/nerdtree>`_
* `vim-airline <https://github.com/vim-airline/vim-airline>`_
* `vim-fugitive <https://github.com/tpope/vim-fugitive>`_
* `vimcdoc <https://github.com/yianwillis/vimcdoc>`_

配置VIM
-------

添加插件的帮助文档：

.. code:: bash

    cd ~/.vim/pack/foo/start/
    vim -u NONE -c "helptags python-mode/doc" -c "helptags nerdtree/doc" -c "helptags vim-airline/doc" -c "helptags vim-fugitive/doc" -c "helptags vimcdoc/doc" -c q

在\ ``$HOME``\ 目录下，添加\ `.vimrc <https://raw.githubusercontent.com/brave1984/brave1984.github.io/develop/gists/.vimrc>`_\ 文件，代码如下：

.. include:: gists/.vimrc
    :code: vim

科学浏览：https://gist.github.com/brave1984/e8231dd2fd399536d8272b110f4a8b7e

.. tip::
    DPS垫底，就是木桩打得少！

    善用\ *:help*\ 文档；在命令行中输入——\ ``vimtutor zh``\ ——命令后，请多加练习！

.. footer::

    本文参考自：\ `VIM and Python – A Match Made in Heaven <https://realpython.com/vim-and-python-a-match-made-in-heaven/>`_