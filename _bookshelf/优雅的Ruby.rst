---
title: 优雅的Ruby
date: 2019-06-10 21:11:24 +0800
categories: 计算
tags: [Ruby]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    作为一本关于编程风格的书，作者总结了一系列有助于编写优雅代码的小技巧。其中，空引用问题用\ **空对象**\ 解决，与\ ``Maybe``\ 函子中的\ ``Nothing``\ 有异曲同工之妙。 

.. 摘要注释

文摘
----

.. compound::

    方法中的大多数代码都可以归为：

    - 输入处理（collecting input）；
    - 功能实现（performing work）；
    - 输出处理（delivering output）；
    - 失败处理（handling failures）；

\ **空对象**\ （Null Object）实现了原型对象相关接口，只是这些方法的实现是不做任何事或返回恰当的默认值而已。

“命令-查询分离”（command-query separation, CQS）原则：方法要么是改变对象状态的命令（command）模式，要么是带返回值的查询（query）模式，但却不应该同时兼具二者。
