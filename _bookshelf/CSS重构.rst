---
title: CSS重构
date: 2019-02-28 22:08:41 +0800
categories: 计算
tags: [Web, 程序设计, CSS]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: excerpt

    CSS样式表的宿命不是僵化，就是重构，而你的宿命则是——主动选择或被动接受——沦为“人肉UI测试器”。

.. 摘要注释

.. epigraph::

    何时进行重构：对\ *DRY*\ 原则的违反；事物可以更为正交；知识扩展了；需求演变了；需要改善性能。

    怎么进行重构：不要在重构的同时试图增加功能；在开始重构之前，确保你拥有良好的测试；采取短小、深思熟虑的步骤。

    -- 《\ `程序员修炼之道`_》第33节/重构

重构的好处不必多说，它的前提是——不破坏软件的功能和架构。

本书主要从架构组织方面谈论“CSS重构”，目的是创建可预测、可复用、可维护、可拓展的CSS架构。

在基于类型的设计中，不仅要处理好互相关联的类型，还要保持模块性。我们可以通过\ Sass_\ 对代码进行物理上的分隔；对样式分层（通用、基础、组件、结构、功能、特定）来构筑抽象屏障。

CSS不是编程语言，所呈现的视觉效果，会因浏览器厂商、版本，以及屏幕尺寸的不同而不同。UI测试实现“半自动化”已是不易，更遑论“自动化”。在你把层叠规则与选择器匹配规则弄懂后，写一点，测一点。

本书所指的\ *模式库*\ ，其实就是《\ `渐进增强`_\ 》中的\ `风格组件`_\ ，可参考\ `Yelp Styleguide`_\ 。

文摘
----

软件架构的\ **可预测**\ 是指可以对软件的工作方式和结构做出准确的假设，可避免如下问题：组件的功能是什么；某一段代码在何处；新代码加到何处。

基础样式
    * 区块元素（\ ``body``\ 、\ ``header``\ 、\ ``nav``\ 、\ ``section``\ 、\ ``article``\ 、\ ``aside``\ 、\ ``footer``\ 、\ ``address``\ ）
    * 标题和文本元素（\ ``h1~h6``\ 、\ ``p``\ 、\ ``figure``\ 、\ ``figcaption``\ 、\ ``pre``\ ）
    * 锚点标签元素（\ ``:link``\ 、\ ``:visited``\ 、\ ``:focus``\ 、\ ``:hover``\ 、\ ``:active``\ ）
    * 文本语义元素（\ ``small``\、\ ``strong``\、\ ``em``\、\ ``b``\、\ ``i``\、\ ``cite``\ 、\ ``q``\、\ ``time``\、\ ``code``\、\ ``mark``\、\ ``del``\、\ ``ins``\、\ ``s``\ 、\ ``abbr``\、\ ``dfn``\、\ ``sub``\、\ ``sup``\ 等）
    * 列表（\ ``ol``\ 、\ ``ul``\ 、\ ``dl``\ 、\ ``li``\ 、\ ``dt``\ 、\ ``dd``\ ）
    * 组合元素（\ ``div``\ 、\ ``main``\ 、\ ``span``\ ）
    * 表格（\ ``table``\ 、\ ``caption``\ 、\ ``colgroup``\ 、\ ``col``\ 、\ ``thead``\ 、\ ``tbody``\ 、\ ``tfoot``\ 、\ ``tr``\ 、\ ``th``\ 、\ ``td``\ ）
    * 表单（\ ``form``\ 、\ ``label``\ 、\ ``input``\ 、\ ``button``\ 、\ ``select``\ 、\ ``datalist``\ 、\ ``optgroup``\ 、\ ``option``\ 、\ ``textarea``\ 、\ ``progress``\ 、\ ``meter``\ 、\ ``fieldset``\ 、\ ``legend``\ ）
    * 图像与媒体资源（\ ``img``\ 、\ ``picture``\ 、\ ``video``\ 、\ ``audio``\ 、\ ``object``\ ）

创建可复用组件的过程可以简化为
    #. 创建组件之前，定义需要实现的行为；
    #. 保持组件样式的粒度，设置合理的默认值；
    #. 若需要重写组件组的可见样式，用容器元素将它们包起来，为该容器定义一个具有区别度的类；
    #. 将定义元素尺寸的任务交给结构化容器。

重构策略
    #. 保持规则集结构的一致性
    #. 删除僵尸代码
    #. 分离CSS和JavaScript
    #. 分离基础样式
    #. 删除冗余的ID
    #. 将ID转化为类
    #. 区分功能性样式
    #. 定义可复用组件
    #. 删除行内CSS和过于模块化的类
    #. 隔离面向特定浏览器的CSS样式

.. footer::
   CSS编码规范：\ `Google <https://google.github.io/styleguide//htmlcssguide.html>`_\ 、\ `WordPress <https://make.wordpress.org/core/handbook/best-practices/coding-standards/css/>`_\ 、\ `18F <https://frontend.18f.gov/css/>`_\ 、\ `@mdo <http://zoomzhao.github.io/code-guide/>`_\ 。

.. _`程序员修炼之道`: /bookshelf/程序员修炼之道/
.. _Sass: http://sass-lang.com/
.. _`渐进增强`: /bookshelf/渐进增强/
.. _`风格组件`: http://styletil.es/
.. _`Yelp Styleguide`: https://www.yelp.com/styleguide
