---
title: 精通Python爬虫框架Scrapy
date: 2019-07-24 15:24:01 +0800
categories: 计算
tags: [Python, 爬虫, Scrapy]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    找到真正的瓶颈的所在位置，去提升它。

.. 摘要注释

本书的精髓是——\ Scrapy_\ 的\ `配置`_\ 、\ `事件`_\ 、以及\ `性能调优`_\ 。

Scrapy_\ 是一个\ Twisted_\ 应用，使用单线程、非阻塞（异步）代码实现并发。只有了解\ *事件驱动*\ 的机制，才能更好地理解本书——\ **将阻塞代码转换为非阻塞代码，让瓶颈位于下载器中**\ 。

文摘
----

.. figure:: /assets/bookshelf/{{ page.title }}/流程.jpg

    基于\ Scrapy_\ 框架的爬虫应用，其开发流程是\ **UR2IM**\ 。

.. figure:: /assets/bookshelf/{{ page.title }}/架构.jpg

    DownloaderMiddleware_\ 、\ SpiderMiddleware_\ 、\ Pipeline_\ 中的钩子方法。

.. image:: /assets/bookshelf/{{ page.title }}/性能模型.jpg

Scrapy_\ 在设计时就将下载器作为瓶颈。从一个低数值的\ ``CONCURRENT_REQUESTS``\ 开始，逐渐增加，直到触及下述限制之一：

- CPU使用率大于80%～90%；
- 源网站延迟过度增长；
- 抓取程序中响应达到了5MB的内存限制。

同时，执行以下操作：

- 始终保持调度器队列（mqs/dqs）中至少有一定量的请求，避免下载器出现URL饥饿；
- 永远不要使用任何阻塞代码或CPU密集型代码。

.. _Scrapy: https://scrapy.org/
.. _Twisted: https://twistedmatrix.com/
.. _配置: https://doc.scrapy.org/en/latest/topics/settings.html
.. _事件: https://doc.scrapy.org/en/latest/topics/signals.html
.. _性能调优: https://doc.scrapy.org/en/latest/topics/telnetconsole.html
.. _DownloaderMiddleware: https://doc.scrapy.org/en/latest/topics/downloader-middleware.html#scrapy.downloadermiddlewares.DownloaderMiddleware
.. _SpiderMiddleware: https://doc.scrapy.org/en/latest/topics/spider-middleware.html#scrapy.spidermiddlewares.SpiderMiddleware
.. _Pipeline: https://doc.scrapy.org/en/latest/topics/item-pipeline.html#writing-your-own-item-pipeline
