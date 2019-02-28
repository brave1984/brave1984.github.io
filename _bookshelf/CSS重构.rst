---
title: CSS重构
date: 2019-02-28 22:08:41 +0800
categories: 计算
tags: [Web, 程序设计, CSS]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: excerpt

    CSS样式表的宿命不是腐败，就是重构。你的宿命则是——主动选择或被动接受——沦为“人肉UI测试器”（哪怕是有“半自动化”工具的辅助）。

.. 摘要注释

CSS不是编程语言，渲染出来的视觉效果，会因浏览器的厂商与型号的不同而不同。

文摘
----

基础样式
    * 区块元素（\ ``body``\ 、\ ``header``\ 、\ ``nav``\ 、\ ``section``\ 、\ ``article``\ 、\ ``aside``\ 、\ ``footer``\ 、\ ``address``\ ）
    * 标题和文本元素（\ ``h1~h6``\ 、\ ``p``\ 、\ ``figure``\ 、\ ``figcaption``\ 、\ ``pre``\ ）
    * 锚点标签元素（\ ``:link``\ 、\ ``:visited``\ 、\ ``:focus``\ 、\ ``:hover``\ 、\ ``:active``\ ）
    * 文本语义元素（\ ``small``\、\ ``strong``\、\ ``em``\、\ ``b``\、\ ``i``\、\ ``cite``\ 、\ ``q``\、\ ``time``\、\ ``code``\、\ ``mark``\、\ ``del``\、\ ``ins``\、\ ``s``\ 、\ ``abbr``\、\ ``dfn``\、\ ``sub``\、\ ``sup``\ 等）
    * 列表（\ ``ol``\ 、\ ``ul``\ 、\ ``dl``\ 、\ ``li``\ 、\ ``dt``\ 、\ ``dd``\ ）
    * 组合元素（\ ``div``\ 、\ ``main``\ 、\ ``span``\ ）
    * 表格（\ ``table``\ 、\ ``caption``\ 、\ ``colgroup``\ 、\ ``col``\ 、\ ``thead``\ 、\ ``tbody``\ 、\ ``tfoot``\ 、\ ``tr``\ 、\ ``th``\ 、\ ``td``\ ）
    * 表单（\ ``form``\ 、\ ``label``\ 、\ ``input``\ 、\ ``button``\ 、\ ``select``\ 、\ ``datalist``\ 、\ ``optgroup``\ 、\ ``option``\ 、\ ``textarea``\ 、\ ``progress``\ 、\ ``meter``\ 、\ ``fieldset``\ 、\ ``legend``\ ）
    * 图像（\ ``img``\ 、\ ``picture``\ ）

创建可复用组件的过程可以简化为
    #. 创建组件之前，定义需要实现的行为；
    #. 保持组件样式的粒度，设置合理的默认值；
    #. 若需要重写组件组的可见样式，用容器元素将它们包起来，为该容器定义一个具有区别度的类；
    #. 将定义元素尺寸的任务交给结构化容器。

