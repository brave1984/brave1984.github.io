---
title: Bootstrap 的使用心得
date: 2019-02-25 21:43:53 +0800
categories: 计算
tags: [Web, Bootstrap, CSS]
gist: 7847ff9b396660b1054f23a0744ffc0c
excerpt_separator: .. 摘要注释

---
.. container:: summary

    \ **萌新**\ ：\ Bootstrap_\ ——真好用！

    \ **休闲玩家**\ ：\ Bootstrap_\ 与\ *HTML*\ 页面耦合在一起，如何维护？

    \ **高端玩家**\ ：用\ Compass_\ 引入\ Bootstrap_\ 。

.. _Bootstrap: https://getbootstrap.com/
.. _Compass: http://compass-style.org/

.. 摘要注释

虽然\ Bootstrap_\ 已经“烂大街”了，但是它至少是个完整的\ *CSS*\ 组件库。\ `Bootstrap 文档`_\ 非常详细，参照示例代码，就能快速上手。

复用\ Bootstrap_\ 所提供的组件样式，有利于原型的制作实现。但原型就是原型，由于HTML页面中充斥着大量无语义的类名，\ *CSS*\ 样式就与\ *HTML*\ 页面深度耦合了。耦合，使得页面代码既不易阅读，也不易修改。

有时，我们并不只是满足于原型的制作，而是希望得到一个曳光弹。在不舍弃\ Bootstrap_\ 的情况下，需要找到一个既能复用组件，又能减少耦合的办法。

从文档着手
----------

在\ `Bootstrap 文档`_\ 中，整个框架按层次被划分为四部分：\ *Layout*\ 、\ *Content*\ 、\ *Components*\ 、\ *Utilities*\ 。

\ *Layout*\ 提供了基于\ Flexbox_\ 的响应式“网格布局”，其中的“列”和“槽”是无语义的类名；\ *Content*\ 提供了文字、图片、代码与表格的排版样式，但大部分都是无语义的展示性类名；\ *Components*\ 提供了一系列通用性组件，如：面包屑、手风琴、轮播等； \ *Utilities*\ 中大都是与元素的盒模型、外观有关的展示性类名。

单个元素的盒模型、排版与外观都可以在外部的\ *CSS*\ 样式表中实现，而\ Bootstrap_\ 的核心则是响应式的“网格布局”与通用性组件。在\ *Layout*\ 部分的\ *Grid*\ 章节中，\ `Sass mixins`_\ 小节提供了可定制、语义化“网格布局”的解决方案——\ Sass_\ 。

学习 Sass
---------

既然官方已给出解决方案，那么我们顺着路走就好了。\ Sass_\ 没听说过，那就去查、去学！

\ Sass_\ 并不难学，它只是一种用于描述\ *CSS*\ 的\ *DSL*\ 而已，可参考\ `Sass 文档`_\ 、《\ `Sass和Compass设计师指南`_\ 》、《\ `Sass与Compass实战`_\ 》。

阅读源码
--------

在\ GitHub_\ 上，可以找到\ Bootstrap_\ 的\ `源码仓库`_\ 。在\ Ruby_\ 社区的\ *Gem*\ 托管——\ RubyGems_\ ，可以获得\ `Bootstrap 源码包`_\ 。

整个\ Bootstrap_\ 框架源码分为两部分：\ *stylesheets*\ 和\ *javascripts*\ ，而\ *javascripts*\ 与交互式组件有关，暂不考虑。\ *stylesheets*\ 是由初始化文件、组件文件、\ *mixins*\ 文件夹与 \ *utilities*\ 文件夹构成。

网格布局
~~~~~~~~

在自有的\ *.scss*\ 文件中，覆盖\ *_variables.scss*\ 中的变量可实现\ Bootstrap_\ 的定制。\ Bootstrap_\ 的“网格布局”是由\ *_grid.scss*\ 调用\ *mixins*\ 目录下\ *_grid.scss*\ 、\ *_grid-framework.scss*\ 中的混合器实现的。

.. include:: gists/{{ page.gist }}/_bootstrap-grid.scss
    :code: sass
    :start-line: 19
    :end-line: 26

\ *mixins*\ 目录下的\ *_grid.scss*\ 文件用于生成“容器”、“行”、“列” ，以及列偏移，“槽”是由参数\ ``$gutter``\ 控制。

.. include:: gists/{{ page.gist }}/_grid.scss
    :code: sass
    :start-line: 4
    :end-line: 11

参数\ ``$max-widths``\ 用于控制“容器”的最大宽度，参数\ ``$breakpoints``\ 用于设置断点，这些参数可以通过传参或使用默认值来调节。混合器\ ``media-breakpoint-up``\ 是由\ *mixins*\ 目录下的\ *_breakpoints.scss*\ 文件提供，用于设置媒体查询。

.. include:: gists/{{ page.gist }}/_grid.scss
    :code: sass
    :start-line: 14
    :end-line: 21

“列”是通过调用混合器\ ``make-col-ready``\ 、\  ``make-col``\ 、\ ``make-col-offset``\ 来实现的，\ ``flex``\ 属性控制列宽，\ ``margin-left``\ 属性控制列偏移。

.. include:: gists/{{ page.gist }}/_grid.scss
    :code: sass
    :start-line: 29
    :end-line: 51

媒体查询
~~~~~~~~

\ Bootstrap_\ 的媒体查询是由\ *mixins*\ 目录下的\ *_breakpoints.scss*\ 文件实现的，这个文件是整个框架的\ **基石**\ 。

\ ``media-breakpoint-up``\ 、\ ``media-breakpoint-down``\ 、\ ``media-breakpoint-between``\ 、\ ``media-breakpoint-only``\ 四个混合器的\ ``$name``\ 参数，只接受\ ``$breakpoints``\ 中的存在的键名。而它们又是基于函数：\ ``breakpoint-next``\ 、\ ``breakpoint-min``\ 、\ ``breakpoint-max``\ ，理解了这3个函数的返回值，也就弄懂了\ Bootstrap_\ 媒体查询的实现方式。

.. include:: gists/{{ page.gist }}/_breakpoints.scss
    :code: sass
    :start-line: 16
    :end-line: 20

.. include:: gists/{{ page.gist }}/_breakpoints.scss
    :code: sass
    :start-line: 25
    :end-line: 29

.. include:: gists/{{ page.gist }}/_breakpoints.scss
    :code: sass
    :start-line: 39
    :end-line: 43

收工
----

\ Bootstrap_\ 自身不包含自动添加厂商前缀的功能，它依赖于\ Autoprefixer_\ （\ *Gem*\ 包：\ autoprefixer-rails_\ ），支持的浏览器见\ browserslist_\ 。

使用\ Autoprefixer_\ 的话，就不再依赖于用\ Compass_\ 添加\ *CSS 3*\ 特性啦！

.. _`Bootstrap 文档`: https://getbootstrap.com/docs/4.3/getting-started/introduction/
.. _Flexbox: https://www.w3.org/TR/css-flexbox-1/
.. _`Sass mixins`: https://getbootstrap.com/docs/4.3/layout/grid/#sass-mixins
.. _Sass: http://sass-lang.com/
.. _`Sass 文档`: http://sass-lang.com/documentation/
.. _`Sass和Compass设计师指南`: /bookshelf/Sass和Compass设计师指南/
.. _`Sass与Compass实战`: /bookshelf/Sass与Compass实战
.. _GitHub: https://github.com/
.. _`源码仓库`: https://github.com/twbs/bootstrap
.. _`Bootstrap 源码包`: https://rubygems.org/gems/bootstrap
.. _RubyGems: https://rubygems.org/
.. _Ruby: https://www.ruby-lang.org/
.. _Autoprefixer: https://github.com/postcss/autoprefixer
.. _autoprefixer-rails: https://rubygems.org/gems/autoprefixer-rails
.. _browserslist: https://getbootstrap.com/docs/4.3/getting-started/browsers-devices/#supported-browsers
