---
title: rst to html
date: 2019-01-02 09:09:59 +0800
categories: 计算
tags:  [Python, docutils, 文档]
excerpt_separator: .. 摘要注释
---

.. class:: excerpt

    高端玩家： `Don't Use Markdown for Technical Docs！ <http://www.ericholscher.com/blog/2016/mar/15/dont-use-markdown-for-technical-docs/>`_

    萌新： 没有什么技术文档是\ *Markdown*\ 无法表述的，不行就加个:html:`<div>`\ 标签。

    野怪： 为咩，不用*Word*?

.. 摘要注释

----

.. role:: html(code)
    :language: html

原由
----
博客内容起初使用\ *Markdown*\ 编写，:html:`<p>`\ 标签添加了首行缩进样式。\
文本转译成\ *HTML*\ 后，原本独立成行的:html:`<img>`\ 标签也就被包裹在了:html:`<p>`\ 标签之中。\
令人不满之处，有两点：

#. 不符合语义；
#. 继承了缩进样式，导致移动端显示时，图片溢出屏幕边界。

解决方案
--------

解决方法不外乎：1、在文本中插入一个醒目的:html:`<div>` 标签；2、使用新的文本标记语言。

Python文档编写工具docutils所支持的，恰好能满足要求。

编写Jekyll 插件，通过管道调用外部Python脚本，
