---
title: 精通Python网络爬虫
date: 2019-07-19 20:27:05 +0800
categories: 计算
tags: [Python, 爬虫, Scrapy]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    从\ urllib_\ 到\ Scrapy_\ ，从模块到框架，从脚本到应用。

.. _urllib: https://docs.python.org/3/library/urllib.html
.. _Scrapy: https://scrapy.org/

.. 摘要注释

.. compound::

    虽然本书只适用于（爬虫领域）从初阶到中阶的过渡阶段，但是它给我留下了深刻的印象，其中的原因有三点：
    
    - 与\ Requests_\ 相比，\ urllib_\ 需要做太多的事；
    - 用\ Fiddler_\ 抓包数据；
    - 17年——\ `Python 3`_\ 环境下的\ Scrapy_\ 书，就这么一两本。

编写增量式爬虫的时候，我们就得考虑维护性的问题了，而引入\ Scrapy_\ 框架就是个好选择。框架抽取了代码的公共部分，为我们搭好了架子，使得我们可以专注于应用的开发。在熟悉框架的前提下，我们的代码也具有了更高的可读性。

初学\ Scrapy_\ 的时候，代码照着书写就行了，但我心中有个疑问——为什么要这样写？在面向对象的编程范式下，\ **继承**\ 弱化了父类与子类间的封装，其核心是一种用于实现“\ *消息自动委托*\ ”的机制。只有查看源码中父类的公共接口，才能解答这个“为什么”。

.. _Requests: http://python-requests.org/
.. _Fiddler: https://www.telerik.com/fiddler
.. _`Python 3`: https://docs.python.org/3/
