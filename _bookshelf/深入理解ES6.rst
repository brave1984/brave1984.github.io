---
title: 深入理解ES6
date: 2019-04-13 22:38:52 +0800
categories: 计算
tags: [JavaScript]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    相较于ECMAScript 5标准，ECMAScript 6标准使\ JavaScript_\ 变得易于使用。

.. _JavaScript: https://developer.mozilla.org/zh-CN/docs/Web/JavaScript

.. 摘要注释

本书有利于读者从ECMAScript 5 向 6迁移，但对于已经熟悉ECMAScript 6的人来说——只能起到一个细节上的补全作用。

掌握ECMAScript 6标准中的新特性，不仅有利于\ JavaScript_\ 代码的编写，还有利于理解其他语言中的同类特性。他山之石，可以攻玉。

文摘
----

在\ ``for-in``\ 和\ ``for-of``\ 循环的每次迭代中，\ ``let``\ 和\ ``const``\ 都会创建新绑定，从而使循环体内创建的函数可以访问到相应迭代的值。在\ ``for``\ 循环中，\ ``let``\ 也是如此，使用\ ``const``\ 则可能引发错误。

\ JavaScript_\ 函数有两个不同的内部方法：\ ``[[Call]]``\ 和\ ``[[Construct]]``\ 。当通过\ ``new``\ 关键字调用函数时，执行的是\ ``[[Construct]]``\ 函数，它负责创建一个通常被称作实例的新对象，然后再执行函数体，将\ ``this``\ 绑定到实例上；如果不通过\ ``new``\ 关键字调用函数，则执行\ ``[[Call]]``\ 函数，从而直接执行代码中的函数体。

箭头函数中的\ ``this``\ 、\ ``super``\ 、\ ``arguments``\ 、\ ``new.target``\ 是由外围最近一层非箭头函数决定的。箭头函数没有\ ``[[Construct]]``\ 方法，所以不能被用作构造函数。

\ ``Object.is``\ 方法对于所有值进行严格等价判断。\ ``Object.assign``\ 方法可以接受任意数量的源对象，并按指定的顺序将属性复制到接收对象中。若多个源对象具有同名属性，则排位靠后的会覆盖排位靠前的。

\ ``super``\ 引用相当于指向对象原型的指针，也就是\ ``Object.getPrototypeof(this)``\ 的值。

在全局作用域中有一个\ ``Symbol``\ 注册表，在代码的不同位置，总是可以通过相同的描述字符串获取同一个\ ``Symbol``\ 。

\ ``Proxy``\ 可以拦截\ JavaScript_\ 引擎内部目标的底层对象操作，\ ``Reflect``\ 对象中方法的默认特性与相同的底层操作一致。
