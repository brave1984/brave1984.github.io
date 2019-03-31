---
title: JavaScript学习指南
date: 2019-03-31 18:26:09 +0800
categories: 计算
tags: [JavaScript, 基础]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    JavaScript_\ 基于\ **单线程**\ 、\ **事件驱动**\ 的执行模型，通过异步代码实现“不阻塞”。

.. _JavaScript: https://developer.mozilla.org/zh-CN/docs/Web/JavaScript

.. 摘要注释

本书基于\ ES6_\ 版本，对\ JavaScript_\ 的语法及应用做了一个较为全面的概览（没有深入原型链），介绍了3个重要的概念：“表达式”、“纯函数”、“函数式编程”。

我是从\ Python_\ 迁移过来的，在我看来——\ ES5_\ 版本的语法过于复杂，在语法上\ ES6_\ 版本同\ Python_\ 、\ Ruby_\ 有了更多的共同特性。虽然在\ ES6_\ 版本中箭头函数、类与继承的实现只是一种语法糖，但是使用起来更为自然。块级作用域、模板字符串、解构赋值、集合、迭代器与生成器、\ ``Promise``\ 、代理与反射、模块化，这些新特性使代码的书写变得更为优雅。

如果你有游戏或\ *GUI*\ 的编写经验（比如：\ Pygame_\ 与\ Tkinter_\ ），那么\ JavaScript_\ 理解起来并不难，请把你的目光聚焦在\ **事件**\ 与\ **回调**\ 上。面对新兴的框架与语言（如：\ React_\ 、\ Go_\ ），\ jQuery_\ 与\ Node.js_\ 的优势已不再明显。

文摘
----

两个值严格相等的前提是它们引用了同一个对象，或者拥有相同的类型和相同的值。

\ ``Array.prototype``\ 方法：\ ``find``\ 、\ ``findIndex``\ 、\ ``some``\ 、\ ``every``\ 、\ ``map``\ 、\ ``filter``\ 、\ ``reduce``\ 会接收一个函数作为参数，会向这个函数传入——元素、下标、数组本身。

如果一个类提供了一个符号方法\ ``Symbol.iterator``\ ，且该方法返回一个具有迭代行为的对象（有\ ``next``\ 方法，且\ ``next``\ 方法返回一个具有\ ``value``\ 和\ ``done``\ 属性的对象），那么这个类就是可迭代的。

\ ``Object.getOwnPropertyDescriptor``\ 方法返回属性描述符，\ ``try``\ 语句无法捕获回调函数中触发的异常。

DOM树（包括文档本身）中的每一个节点都是一个节点类（Node class）的实例，节点（Node）对象拥有父节点（parentNode）、子节点（childNode）、节点名（nodeName）和节点类型（nodeType）等属性。

在HTML5中，事件的传播是从事件捕获开始，然后才是事件冒泡。\ ``preventDefault``\ 可以取消事件，但被取消的事件还会继续传播，浏览器内置的事件处理器将被阻止；\ ``stopPropagation``\ 、\ ``stopImmediatePropagation``\ 可以阻止事件的传播，二者的区别是：绑定到当前元素上的未调用的处理器会否被调用。

.. compound::

    jQuery_\ 有三大主要优势：

    - 屏蔽了浏览器对DOM API实现的差异性
    - 提供了更简单的Ajax API
    - 提供了很多强大且简洁的增强功能

Node.js_\ 模块分为三大类，核心模块（core modules）、文件模块（file modules）和npm模块。

.. footer::

    什么——你想编写具有面向对象风格的\ JavaScript_\ 代码？那你可以试试《\ `React快速上手开发`_\ 》……

.. _Python: https://www.python.org/
.. _Ruby: https://www.ruby-lang.org/en/
.. _ES5: http://www.ecma-international.org/publications/files/ECMA-ST-ARCH/ECMA-262%205th%20edition%20December%202009.pdf
.. _ES6: http://www.ecma-international.org/ecma-262/6.0/index.html
.. _Pygame: https://www.pygame.org/
.. _Tkinter: https://wiki.python.org/moin/TkInter
.. _React: https://reactjs.org/
.. _Go: https://golang.org/
.. _jQuery: https://jquery.com/
.. _Node.js: https://nodejs.org/en/
.. _`React快速上手开发`: https://amzn.to/2CJuGzW
