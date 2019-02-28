---
title: Sass和Compass设计师指南
date: 2019-02-27 19:38:46 +0800
categories: 计算
tags: [Web, CSS, Sass&Compass]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: excerpt

    \ Sass_\ 是一种用\ Ruby_\ 开发的、用于编写\ *CSS*\ 的\ *DSL*\ （领域特定语言），\ Compass_\ 是一个用以搭建\ Sass_\ 开发环境的框架。

.. _Sass: http://sass-lang.com/
.. _Ruby: https://www.ruby-lang.org/
.. _Compass: http://compass-style.org/

.. 摘要注释

作者利用\ Sass_\ 和\ Compass_\ ，从无到有地构建了一个采用网格布局（\ Susy_\ ）与媒体查询的响应式页面。读完本书，你会发出“Sass与Compass也不过如此”的感慨！

首先，\ Sass_\ 不一定能让我们写出比以前更优化的代码，它只是个工具而已；其次，因为它只是个\ *CSS*\ 的预处理工具，所以并不难学。

谈到\ *CSS*\ 中的\ *class*\ (类），就不能不联想到面向对象程序设计。我们需要通过\ **继承**\ 、\ **抽象类**\ 以及\ **接口**\ ，来实现代码重用。为了克服系统的复杂性，我们又得进行模块化——划分出具有内聚力的组件。

\ Sass_\ 的最大特点是\ **嵌套**\ ，它是\ Sass_\ 中代码的组织形式。

.. compound::

    \ Sass_\ 是通过\ **指令**\ 来重用代码的。

    \ ``@extend``\ 实现了继承，带\ *%*\ 的占位符选择器实现了抽象类，\ ``@include``\ 实现了接口（\ ``@mixin``\ ）的调用。变量、\ ``#{}``\ 、\ ``!default``\ 、\ ``&``\ 解决了硬编码的问题，\ ``@if``\ 、\ ``@for``\ 、\ ``@each``\ 、\ ``@while``\ 与函数组成了代码重用的最小单位，\ ``@import``\ 将代码按照组件的层次进行划分。

通过阅读\ `Sass文档`_\ ，你能够全面地掌握\ Sass_\ 的语法规则：数据类型、变量、运算符、控制流程、参数与作用域、函数与类的定义及使用、模块的导入、编译输出。

\ Compass_\ 除了为我们搭建\ Sass_\ 开发环境外，还提供了一系列的有用的混合器（如：样式重置、\ *CSS3*\ 特性、图像精灵与数据URI等），再也不用为厂商前缀而烦恼啦！

注意事项：不要嵌套得太深；选择器不要过于具体，够用就好。至于\ Sass_\ 与\ Compass_\ 的安装问题，你需要学习就是那么一点命令行与\ Ruby_\ 知识(《\ `Ruby基础教程`_\ 》）。

.. footer::
    感谢\ *Ben Frain*\ 和他的两本好书（另一本《\ `响应式Web设计`_\ 》），还有就是\ `他的网站`_\ 设计得真好（比我的好太多了），他的推特是\ `@benfrain`_\ 。

    进阶——请阅读《\ `Sass与Compass实战`_\ 》和《\ `Sass文档`_\ 》！

.. _`Susy`: https://oddbird.net/susy/
.. _`Sass文档`: http://sass-lang.com/documentation/
.. _Ruby: https://www.ruby-lang.org/
.. _`Ruby基础教程`: https://amzn.to/2TWfIgs
.. _`响应式Web设计`: /bookshelf/响应式Web设计/
.. _`他的网站`: https://benfrain.com/
.. _`@benfrain`: https://twitter.com/benfrain
.. _`Sass与Compass实战`: /bookshelf/Sass与Compass实战/
