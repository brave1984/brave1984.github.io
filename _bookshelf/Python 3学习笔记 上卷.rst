---
title: Python 3学习笔记 上卷
date: 2019-04-22 22:49:12 +0800
categories: 计算
tags: [Python]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    “会”\ Python_\ 的人很多，符合\ *Pythonic*\ 风格的代码却不多。

.. _Python: https://www.python.org/

.. 摘要注释

本书的独到之处在于——利用\ ``dis``\ 模块对字节码进行“反汇编”。2～9章，可看作是《\ `Python学习手册`_\ 》的精华版；11章，能够学会用\ *unittest*\ 模块进行单元测试。

用\ *unittest*\ 模块进行单元测试，需要编写太多的样板代码，推荐使用\ pytest_\ 。不管换用哪个工具，测试都离不开：装载测试夹具、模拟外部资源、组织与维护用例、生成结果报告。

文摘
----

人们常说Python简单易学，但这是以封装和隐藏复杂体系为代价的。

通常将进程内存分作堆（heap）和栈（stack）两类：堆可自由申请，通过指针存储自由数据；而栈则用于指令执行，与线程相绑定。函数调用和执行都依赖线程栈存储上下文和执行状态。系统栈用于机器执行，用户栈存储用户代码执行状态。

.. image:: /assets/bookshelf/{{ page.title | replace: ' ', '%20' }}/frame.jpg

因为函数默认实现了描述符协议，所以当以实例或类型访问方法时，类型或实例将作为参数被传入\ ``__get__``\ ，从而截获绑定目标（\ ``__self__``\ ）。

.. image:: /assets/bookshelf/{{ page.title | replace: ' ', '%20' }}/unittest.jpg

- \ ``TestCase``\ ：测试用例（实现一到多个测试方法）
- \ ``TestSuite``\ ：测试套件（组合多个用例或套件）
- \ ``TestLoader``\ ：加载器（查找测试方法）
- \ ``TestRunner``\ ：执行器（执行测试，返回测试结果）
- \ ``TestResult``\ ：测试结果

.. footer::

    .. epigraph::

        伫倚危楼风细细，望极春愁，黯黯生天际。

        -- 柳永

    非常好的一本书，期待它的下卷。

.. _Python学习手册: /bookshelf/Python学习手册/
.. _pytest: https://github.com/pytest-dev/pytest
