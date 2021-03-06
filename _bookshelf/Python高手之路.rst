---
title: Python高手之路
date: 2019-06-24 11:35:45 +0800
categories: 计算
tags: [Python]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    Python_\ 项目该如何发布与维护？

.. _Python: https://www.python.org/

.. 摘要注释

作者讲述了\ Python_\ 项目发布与维护的经验，涉及有打包分发、文档与测试、依赖与API的管理、性能优化、兼容性处理等主题，还集结了对其他\ Python_\ 高手的访谈。

文摘
----

框架和外部库的主要不同在于：应用程序是建立在框架之上的，代码对框架进行扩展而不是反过来；而外部库更像是对代码的扩展，赋予你的代码更多额外的能力。

.. compound::

    对于API的演化、废弃、移除的衡量标准：

    - 对用户来说让库适应他们的代码有多困难？
    - 这个修改会让维护变得更容易吗？
    - 修改之后我的API会变得更加一致（还是会更不一致）？
    - 用户如何从这次修改中获益？

使用时区感知的\ ``datetime``\ 对象（即包含时区信息）或使用\ `ISO 8601`_\ 作为输入和输出字符串格式。

``super``\ 类接收一个或两个参数，第一个参数是一个类，第二个参数是第一个参数的子类或实例。返回的对象就像是第一个参数的父类的一个代理，它有自己的\ ``__getattribute__``\ 方法去遍历\ **MRO**\ 列表中的类并返回第一个满足条件的属性。

`six`_\ 是一个能实现向前和向后兼容的模块（充当Python 2和Python 3之间的桥梁）。

.. _`ISO 8601`: https://en.wikipedia.org/wiki/ISO_8601
.. _six: https://pypi.org/project/six/
