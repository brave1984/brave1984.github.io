---
title: 响应式Web设计
date: 2019-02-26 13:56:38 +0800
categories: 计算
tags: [Web, HTML, CSS]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    学习用于构建“响应式Web应用”的基础工具集——\ *HTML5*\ 语义元素、\ `媒体查询`_\ 、\ Flexbox_\ 、\ *SVG*\ 、\ *CSS3*\ 选择器与特效。

.. _`媒体查询`: https://www.w3.org/TR/css3-mediaqueries/
.. _Flexbox: https://www.w3.org/TR/css-flexbox-1/

.. 摘要注释

\ `响应式Web设计`_\ 的基本工具是\ **流体栅格**\ 、\ **灵活适应的媒体**\ ，以及\ `媒体查询`_\  。遵循“移动优先”的策略——先从小屏幕开始，再向大屏幕扩展——进行设计开发。在\ `响应式Web设计`_\ 中，如果小屏幕上不加载某一部分内容，那么大屏幕上也不应加载。

IE 9 及以上版本支持\ `媒体查询`_\ ，IE 9及以下版本不支持\ Flexbox_\ （具体信息参见：\ `Can I use <https://caniuse.com/#feat=flexbox>`_\ ）。

使用外部\ *SVG*\ 资源代替\ *CSS sprite*\ ，但在所有兼容\ *SVG*\ 的IE版本（9、10、11）里，不能引用外部\ *SVG*\ 资源。

文摘
----

Flexbox
~~~~~~~

.. image:: https://www.w3.org/TR/css-flexbox-1/images/flex-direction-terms.svg
    :alt: An illustration of the various directions and sizing terms as applied to a row flex container.

\ Flexbox_\ 有4个关键特性：方向、对齐、次序和弹性。关于\ Flexbox_\ 的对齐，最重要的是理解“主轴”和“交叉轴”。若\ Flexbox_\ 的方向为 row ，则主轴就是横轴，交叉轴就是纵轴；反之，若\ Flexbox_\ 的方向为 column ，则主轴就是纵轴，交叉轴为横轴。\ *flex*\ 对应：伸展（\ *flex-grow*\ ）、收缩（\ *flex-shrink*\ ）、基准（\ *flex-basis*\ ）。

*display* : flex | inline-flex

*flex-direction* : row | row-reverse | column | column-reverse

*flex-wrap* : nowrap | wrap | wrap-reverse

*flex-flow* : <*flex-direction*> || <*flex-wrap*>

.. figure:: https://www.w3.org/TR/css-flexbox-1/images/flex-pack.svg
    :alt: An illustration of the five justify-content keywords and their effects on a flex container with three colored items.

    *justify-content* : flex-start | flex-end | center | space-between | space-around

.. figure:: https://www.w3.org/TR/css-flexbox-1/images/flex-align.svg
    :alt: An illustration of the five align-items keywords and their effects on a flex container with four colored items.

    *align-items* : flex-start | flex-end | center | baseline | stretch

*align-self* : auto | flex-start | flex-end | center | baseline | stretch

*order* :  <integer>

*flex-grow* : <number>

*flex-shrink* : <number>

*flex-basis* : content | <width>

*flex* : none | [ <*flex-grow*> <*flex-shrink*>? || <*flex-basis*> ]

CSS3 伪类选择器
~~~~~~~~~~~~~~~

- \ ``:first-child``\ 、\ ``:last-child``\ 、\ ``:not``\ 、\ ``:empty``\ 、\ ``:has``\
- \ ``:nth-child(n)``\ ，选择第\ ``n``\ 项；\ ``:nth-child(an+b)``\ ，选择第\ ``b``\ 项，且每\ ``a``\ 个选一个；传入\ ``odd``\ 选奇数项，传入\ ``even``\ 选偶数项。\ ``:nth-child``\ 选择\ **同级DOM**\ 中的子元素，\ ``:nth-last-child``\ 反向选取。而\ ``:nth-of-type``\ 、\ ``:nth-last-of-type``\ 则区分标记类型。

CSS3 过渡、变形、动画
~~~~~~~~~~~~~~~~~~~~~

.. compound::

    当知道动画的起始状态和终止状态，并且需要一个简单的变形方法时，使用\ `CSS3过渡`_\ ：

    - transition-property：要过渡的CSS属性的名字
    - transition-duration：定义过渡效果持续的时长
    - transition-timing-function：定义过渡期间的速度变化
    - transition-delay：用于定义过渡开始前的延迟时间
    - `transitions示例 <https://cssreference.io/transitions/>`_

.. compound::

    当需要在视觉上改变某个元素但又不想影响页面布局的时候，使用\ `CSS3变形`_\ （默认的变形原点在元素正中心）：

    - scale：用来缩放元素（放大和缩小）
    - translate：在屏幕上移动元素（上下左右）
    - rotate：按照一定角度旋转元素（单位为度）
    - skew：沿X和Y轴对元素进行斜切
    - `transform示例 <https://cssreference.io/property/transform/>`_

.. compound::

    当想在一个元素上执行一系列关键帧动画时，使用\ `CSS3动画`_\ ：

    - animation-name：关键帧声明
    - animation-duration：持续时长
    - animation-timing-function：速度变化
    - animation-iteration-count：运行次数（infinite，无限次）
    - animation-play-state：running | paused;
    - animation-delay：开始延迟
    - animation-fill-mode：none | forwards | backwards | both;
    - animation-direction：播放方向（normal | reverse | alternate | alternatereverse）
    - `animations示例 <https://cssreference.io/animations/>`_

.. _`响应式Web设计`: https://alistapart.com/article/responsive-web-design
.. _`CSS3过渡`: https://www.w3.org/TR/css-transitions-1/
.. _`CSS3变形`: https://www.w3.org/TR/css-transforms-1/
.. _`CSS3动画`: https://www.w3.org/TR/css-animations-1/
