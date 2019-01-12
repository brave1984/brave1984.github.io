---
title: .rst to .html
date: 2019-01-02 09:09:59 +0800
categories: 计算
tags:  [Python, 文档, 工具]
excerpt_separator: .. 摘要注释
---

.. role:: html(code)
    :language: html

.. role:: python(code)
    :language: python

.. class:: excerpt

    高端玩家： `Don't Use Markdown for Technical Docs！ <http://www.ericholscher.com/blog/2016/mar/15/dont-use-markdown-for-technical-docs/>`_

    萌新： 没有什么技术文档是\ *Markdown*\ 无法表述的，不行就加个\ :html:`<div>`\ 标签。

    野怪： 为咩不用\ *Word*\ ?

.. 摘要注释

----

起因
----

博客内容起初使用\ *Markdown*\ 编写，\ :html:`<p>`\ 标签添加了首行缩进样式。\
文本转译成\ *HTML*\ 后，原本独立的\ :html:`<img>`\ 标签也被包裹在\ :html:`<p>`\ 标签中。\
这就导致：

#. 不符合语义；
#. 移动端显示时，图片因缩进，而溢出屏幕边界。

经过
----

解决方法不外乎：1、在文本中插入一个\ :html:`<div>`\ 标签；2、使用新的文本标记语言。

因为插入\ :html:`<div>`\ 标签不能彻底解决遗留问题，所以将\ *Markdown*\ 替换成\ reStructuredText_\ （被用于编写\ *Python*\ 文档）。\
\ *reStructuredText*\ 可以通过\ *include*\ 指令引入外部文档（如：代码片段），达到去除冗余的目的。

接下来，要做的只是：编写一个\ Jekyll_\  \ Converters_\ 插件，通过管道调用外部的\ *Python*\ 脚本，将\ *rst*\ 格式转换成\ *html*\ 格式。

\ Docutils_\ 源码中提供了相应的工具：\ rst2html5_.py，但这个转换脚本将输出一个带有\ :html:`<head>`\ 部分的\ *html*\ 文本。\
:python:`publish_cmdline`\ 函数位于docutils目录下的\ core_.py文件中，此文件中包含有一个\ :python:`Publisher`\ 类和多个以“\ *publish*\ ”开头的函数。

通过阅读文档字符串，可以看到\ :python:`publish_parts`\ 函数返回：\ *a dictionary of document parts*\ (\ :python:`pub.writer.parts`\ )。\
\ :python:`pub`\ 对象，又是通过调用\ :python:`publish_programmatically`\ 函数——实例化\ :python:`Publisher`\ 类——产生的。

在\ *docutils/writers*\ 目录下的\_\ html_base_\.py中可以获悉一个\ *HTML*\ 文档究竟是由哪几部分构成：

.. code:: python

    visitor_attributes = (
        'head_prefix', 'head', 'stylesheet', 'body_prefix',
        'body_pre_docinfo', 'docinfo', 'body', 'body_suffix',
        'title', 'subtitle', 'header', 'footer', 'meta', 'fragment',
        'html_prolog', 'html_head', 'html_title', 'html_subtitle',
        'html_body')

于是乎，我们可以编写出如下的\ *.rst to .html*\ 转换函数：

.. include:: _plugins/rst2html/rst2html5.py
    :code: python
    :start-line: 35
    :end-line: 46

* `settings_overrides参数配置 <https://sourceforge.net/p/docutils/code/HEAD/tree/trunk/docutils/docutils/writers/html5_polyglot/__init__.py#l48>`_\
* `writer_name参数配置 <https://sourceforge.net/p/docutils/code/HEAD/tree/trunk/docutils/docutils/writers/__init__.py#l120>`_\
* `docutils配置 <http://docutils.sourceforge.net/docs/user/config.html>`_
* `Dracula for Pygments <https://github.com/dracula/pygments>`_\ ，请将样式表中的\ *highlight*\ 类替换成\ *code*\ 类。
* `扩展reStructuredText指令 <http://docutils.sourceforge.net/docs/howto/rst-directives.html>`_

结果
----
在\ *_plugins*\ 目录下的\ *rst2html*\ 文件夹中，编写插件。

*converter.rb*\ ，代码如下：

.. include:: _plugins/rst2html/converter.rb
    :code: ruby

*rst2html5.py*\ ，代码如下：

.. include:: _plugins/rst2html/rst2html5.py
    :code: python
    :start-line: 22

.. footer::

    `GitHub Gist 仓库链接 <https://gist.github.com/{{ page.gist }}.git>`_\ （如果碰到网络连线问题，你懂的。）

.. _reStructuredText: http://docutils.sourceforge.net/rst.html
.. _Jekyll: https://jekyllrb.com/
.. _Converters: https://jekyllrb.com/docs/plugins/converters/
.. _Docutils: http://docutils.sourceforge.net/
.. _rst2html5: https://sourceforge.net/p/docutils/code/HEAD/tree/trunk/docutils/tools/rst2html5.py
.. _core: https://sourceforge.net/p/docutils/code/HEAD/tree/trunk/docutils/docutils/core.py
.. _html_base: https://sourceforge.net/p/docutils/code/HEAD/tree/trunk/docutils/docutils/writers/_html_base.py

