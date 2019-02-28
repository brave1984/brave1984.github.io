---
title: Sass与Compass实战
date: 2019-02-27 23:39:11 +0800
categories: 计算
tags: [Web, CSS, Sass&Compass]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: excerpt

    没法设计出令人惊艳的Web页面时，就使用\ **垂直韵律**\ 让它中规中矩吧！

.. 摘要注释

在讲述了\ Sass_\ 的基本语法后，本书的着重点在于使用\ Compass_\ 实现网格布局、文本排版、CSS3特性、精灵、\ ``config.rb``\ 文件配置、样式表调优、以及扩展分发。

通过\ ``compass/typography/vertical_rhythm``\ 管理\ **垂直韵律**\ （行与行之间内容的留白），我解决了页面文本乱杂无章的问题。

\ Compass_\ 方便了大家在CSS中引用图片资源、合成\ *CSS sprites*\ 以及\ *data URI*\ ，但我个人更倾向于使用\ *SVG sprites* \ 代替\ *CSS sprites*\ （推荐\ `Font Awesome`_\ 服务）。

文摘
----

.. epigraph::

  我们需要从人的角度考虑问题，人们怎样编写程序或者怎样使用机器上的应用程序。我们是主人，它们是仆人。

  --- 松本行弘

类名具有\ **语义化**\ 含义，混合器则是作为一种\ **展示性**\ 描述。判断一组属性是否应该组合成一个混合器，一条经验法则就是——能否为这些属性取一个描述性的名字。

继承应建立在语义化的关系上，它遵从CSS层叠规则，与混合器相比，继承生成的CSS代码相对更少。值得注意的是：尽量不要使用后代选择器去继承CSS规则。

CSS网格布局的核心由\ *容器*\ 、\ *列*\ 、\ *槽*\ 构成。

+--------+--------------------------------+------------------+
| 术语名 | 定义                           | 是否涉及HTML标签 |
+========+================================+==================+
| 容器   | 构成一个网格布局的HTML元素     | 是               |
+--------+--------------------------------+------------------+
| 列     | 内容度量的垂直单位             | 否               |
+--------+--------------------------------+------------------+
| 槽     | 网格布局中列与列之间的统一留白 | 否               |
+--------+--------------------------------+------------------+

源码控制的最佳实践表明：非手工编辑的生成文件不应该出现在源码控制中，如：编译生成的CSS文件。

.. footer::
    \ `Compass的命令行选项`_\ ，进阶——请阅读与使用\ Compass_\ 、\ Bootstrap_\ 、\ Foundation_\ 的源码。

.. _Sass: http://sass-lang.com/
.. _Compass: http://compass-style.org/
.. _`Font Awesome`: https://fontawesome.com/
.. _Bootstrap: https://github.com/twbs/bootstrap-rubygem/
.. _Foundation: https://github.com/zurb/foundation-sites
.. _`Compass的命令行选项`: http://compass-style.org/help/documentation/command-line/
