---
title: HTML5与CSS3基础教程
date: 2019-02-26 08:54:51 +0800
categories: 计算
tags: [Web, HTML, CSS, 基础]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    一张网页主要是由\ **文本内容**\ 、\ **对其他文件的引用**\ 和\ **标记**\ 构成的。

.. 摘要注释

本书作为\ *HTML5*\ 与\ *CSS3*\ 的基础教程，恰到好处地提供了\ *Web初学者*\ 所应掌握的内容——编写语义化的\ *HTML*\ 页面与简单的\ *CSS*\ 样式表。

\ *HTML5*\ 在原有的\ *HTML*\ 基础上，新增了很多\ **语义化**\ 元素。\ **语义化**\ 使得页面结构清晰完整（不再是清一色的\ ``div``\ 元素了），提升了网站的可访问性，有利于\ *CSS*\ 样式表的编写与维护。什么——你想增加网络爬虫的采集难度，让\ Google_\ 爬虫引擎多干些活？

\ *HTML5*\ 中新增的语义化元素有：\ ``header``\、\ ``main``\、\ ``nav``\、\ ``section``\、\ ``article``\、\ ``aside``\、\ ``footer``\、\ ``video``\、\ ``audio``\、\ ``figure``\、\ ``figcaption``\ 、\ ``small``\、\ ``strong``\、\ ``em``\、\ ``b``\、\ ``i``\、\ ``cite``\、\ ``blockquote``\、\ ``q``\、\ ``time``\、\ ``address``\、\ ``pre``\、\ ``code``\、\ ``mark``\、\ ``del``\、\ ``ins``\、\ ``s``\ 、\ ``abbr``\、\ ``dfn``\、\ ``sub``\、\ ``sup``\、以及新的表单控件……

响应式Web设计，需要通过媒体查询和设置宽度断点，来实现——图像与媒体资源的可伸缩、页面结构的弹性布局。

文摘
----

\ `渐进增强`_\ ：\ *HTML*\ 提供基本\ **内容**\ ，\ *CSS*\ 提供样式\ **布局**\ ，\ *JavaScript*\ 提供额外\ **行为**\。

\ *CSS*\ 样式规则由选择器（选取哪些元素进行格式化）和声明块（描述要执行的格式化）组成。声明块以\ *前花括号*\ 开始，以\ *后花括号*\ 结束，其中的每条声明都是由以冒号隔开、分号结尾的名-值对构成的。

\ *CSS*\ 选择器
    * 元素选择器
    * 上下文选择器
    * 类/ID选择器
    * 伪类/伪元素选择器
    * 属性选择器

.. csv-table::
    :header: "选择器", "属性值"

    ``[attribute]``, 匹配指定属性，不论具体值是什么
    ``[attribute="value"]``, 完全匹配指定属性值
    ``[attribute~="value"]``, 属性值是以空格分隔的多个单词，其中有一个完全匹配指定值
    ``[attribute|="value"]``, 属性值以value-打头
    ``[attribute^="value"]``, 值以value开头，value为完整的单词或单词的一部分
    ``[attribute$="value"]``, 属性值以value结尾，value为完整的单词或单词的一部分
    ``[attribute*="value"]``, 值为指定值的子字符串

同一\ *CSS*\ 属性的渲染规则：相同引入方式，遵循\ **顺序性**\、\ **特殊性**\ 、\ **重要性**\ ；不同引入方式，遵循默认样式、外部样式、嵌入样式、内联样式。

\ *CSS*\ 中的\ **盒模型**\ ：每个元素都包含在一个不可见的盒子里，由内容区域、内边距、边框、外边距构成。

.. footer::
    读完本书后，《\ `响应式Web设计`_ \》可以充当进阶指引。
    
    * `HTML Reference <https://htmlreference.io/>`_ - A free guide to all HTML elements and attributes.
    * `CSS Reference <https://cssreference.io/>`_ - A free visual guide to CSS.

.. _Google: https://www.google.com/
.. _`渐进增强`: https://en.wikipedia.org/wiki/Progressive_enhancement
.. _`响应式Web设计`: /bookshelf/响应式Web设计/
