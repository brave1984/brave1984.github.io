---
title: Virtualenv 是如何被激活的？
date: 2019-03-12 17:14:14 +0800
categories: 计算
tags: [Python, Shell, Virtualenv]
gist: 575714efaedec34e088e0a1a4c6d177c
excerpt_separator: .. 摘要注释

---
.. container:: summary

    \ **萌新**\ ：\ Virtualenv_\  是如何被激活的呀？

    \ **休闲玩家**\ ：没看过\ ``bin``\ 目录下的\ ``activate``\ 文件？

    \ **高端玩家**\ ：\ ``activate``\ 文件就是个shell脚本。

.. _Virtualenv: https://virtualenv.pypa.io/en/latest/

.. 摘要注释

将函数导入 Shell
-----------------

.. compound::

    \ *source*\ 命令可以读取并执行指定文件中的命令（在当前shell环境中），别名是\ ``.``\ 号。

    #. 用\ ``cat``\ 命令在\ ``add.sh``\ 文件中写入一个“求两数之和”的函数\ ``add``\ ；
    #. 用\ ``cat``\ 命令查看\ ``add.sh``\ 文件的内容；
    #. 用\ ``source``\ 命令从\ ``add.sh``\ 文件中导出\ ``add``\ 函数；
    #. 用\ ``type``\ 命令查看\ ``add``\ 的类型;
    #. 用\ ``add``\ 函数求“二加二”的和。

.. code:: bash

    cat > add.sh << EOF
    #! /bin/bash

    add () {
        echo \$[ \$1 + \$2 ]
    }
    EOF

    cat add.sh
    source add.sh
    type add
    add 2 2

阅读源码
--------

用\ Virtualenv_\ 创建一个虚拟环境目录\ ``venv``\ ，查看其中\ ``bin``\ 目录下的\ ``activate``\ 文件。

.. code:: bash

    virtualenv venv
    source venv/bin/activate
    vi venv/bin/activate

\ ``activate``\ 文件开头定义了一个名为\ ``deactivate``\ 的函数，暂且先跳过它。接着，设置全局环境变量\ ``VIRTUAL_ENV``\ ，其值为虚拟环境目录的名字（当前为\ ``venv``\ ）。

.. include:: gists/{{ page.gist}}/activate
    :code: bash
    :start-line: 42
    :end-line: 44

用变量\ ``_OLD_VIRTUAL_PATH``\ 维持当前搜索路径\ ``$PATH``\ 的值。因为虚拟环境的\ ``bin``\ 目录下有指向\ Python_\ 解释器的符号链接和其它可执行文件，所以将其追加到\ ``$PATH``\ 中，并导出。

.. include:: gists/{{ page.gist}}/activate
    :code: bash
    :start-line: 45
    :end-line: 48

\ Python_\ 解释器维持着一个环境变量\ ``$PYTHONHOME``\ ，用命令\ ``$python --help | more``\ 查看它的描述——作为\ ``sys.prefix``\ 或\ ``sys.exec_prefix``\ 的备用前缀目录，会影响模块搜索路径\ ``sys.path``\ 。

.. include:: gists/{{ page.gist}}/activate
    :code: bash
    :start-line: 50
    :end-line: 54

环境变量\ ``$PS1``\ 持有\ **主命令行提示符字符串**\ ，用\ ``basename``\ 命令获取虚拟环境目录的名字后，修改\ ``$PS1``\ 并导出。

.. include:: gists/{{ page.gist}}/activate
    :code: bash
    :start-line: 55
    :end-line: 64

函数\ ``deactivate``\ 用于还原修改过的环境变量，在命令行中调用就行。

.. include:: gists/{{ page.gist}}/activate
    :code: bash
    :start-line: 3
    :end-line: 38

.. _Python: https://www.python.org/
