---
title: JavaScript函数式编程指南
date: 2019-04-11 13:43:36 +0800
categories: 计算
tags: [JavaScript, 函数式]
gist:
excerpt_separator: .. 摘要注释

---
.. container:: summary

    .. epigraph::

        面向对象编程通过\ **封装**\ 变化使得代码更易理解；

        函数式编程通过\ **最小化**\ 变化使得代码更易理解。

        -- Michael Feathers

.. 摘要注释

作者利用\ Underscore_\ 、\ Lodash_\ 、\ Ramda_\ 、\ RxJS_\ 等代码库编写函数式代码示例，并与命令式代码示例进行比对，指出——函数式代码具有易推理、易测试的优点，函数式编程有利于驯服系统的复杂性。

有了\ ``curry``\ 、\ ``partial``\ 、\ ``compose``\ ，就能实践函数式编程了么？

我的答案是：不能。半年多前，我就看完了这本书，但我没办法将函数式编程真正应用于代码实践当中。函数式编程可以简单地归结为：分解与组合，但\ ``curry``\ 、\ ``partial``\ 、\ ``compose``\ 对于完成函数式编程是远远不够的。

尽管我对\ *Scheme*\ 与\ Clojure_\ 的认知是肤浅的，但还是想谈谈——我对实践“函数式编程”的想法。作为\ *Lisp*\ 的方言，所有的\ *Scheme*\ 与\ Clojure_\ 代码都是由表达式组成的，每个表达式会求值产生一个值。\ **前缀表示法**\ 简化了语法，\ **括号**\ 使得“代码即数据”。表达式是函数式编程的基石，相较于其他语言中无值的控制语句，\ *Lisp*\ 中的条件判断都是表达式。在\ JavaScript_\ 中使用三元运算符表示多路分支是多么的可怕啊，而且比较运算符不是过程，不符合\ *point-free*\ 风格。

为了能用\ JavaScript_\ 进行函数式编程，我们需要借助外部的工具库来抽象过程和保证数据的不可变。\ Underscore_\ 、\ Lodash_\ 的传参方式不符合\ *point-free*\ 风格，而\ Ramda_\ 是专门为函数式编程风格而设计。

真实世界中充满了状态，我们需要把不纯的部分从函数中抽离出来，将状态控制在局部。既然函数是值，那么也就能放入函子当中，使用\ *IO Monad*\ 与外部资源进行交互。关于\ *Monad*\ 的更多信息，可参考\ *欧阳继超*\ （本书译者之一）的《\ `前端函数式攻城指南`_\ 》。

\ jQuery_\ 所代表的命令式编程，已不足已应对当下前端系统所面对的复杂性。拥抱声明式编程，创建反应式应用。

文摘
----

函数式编程的目标是使用函数来\ **抽象作用在数据上的控制流与操作**\ ，从而在系统中\ **消除副作用**\ 并\ **减少对状态的改变**\ 。

面向对象编程通过特定的行为将很多数据类型逻辑地连接在一起，函数式编程则关注如何在这些数据类型之上通过组合来连接各种操作。

.. image:: /assets/bookshelf/{{ page.title }}/compare.jpg

\ **方法链接**\ 通过对象的方法紧密连接，而\ **管道**\ 以函数作为组件，将函数的输入和输出松散地连接在一起。但是，为了实现管道，被连接的函数必须在元数（arity）和类型上相互兼容。

.. figure:: /assets/bookshelf/{{ page.title }}/pipeline.png
    :alt: pipeline

    方法链接（紧耦合，有限的表现力）

.. figure:: /assets/bookshelf/{{ page.title }}/compose.png
    :alt: compose

    函数的管道化（松耦合，灵活）

.. footer::

    \ Hy_\ 是一种运行在\ Python_\ 虚拟机上的\ *Lisp*\ 方言。

    开源社区承担了工具库的开发与维护的责任，那我这种普通人就先从“借鸡生蛋”开始……

.. _Underscore: https://underscorejs.org/
.. _Lodash: https://lodash.com/
.. _Ramda: https://ramdajs.com/
.. _RxJS: https://rxjs.dev/
.. _Clojure: https://www.clojure.org/
.. _JavaScript: https://developer.mozilla.org/zh-CN/docs/Web/JavaScript
.. _jQuery: https://jquery.com/
.. _Hy: https://github.com/hylang/hy
.. _Python: https://www.python.org/
.. _前端函数式攻城指南: https://amzn.to/2VEK6wH
