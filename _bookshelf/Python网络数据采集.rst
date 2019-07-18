---
title: Python网络数据采集
date: 2019-07-16 13:28:17 +0800
categories: 计算
tags: [Python, 爬虫]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    爬虫，有趣的编程实践。

.. 摘要注释

在这有趣的书里，作者讲解了与\ Python_\ 爬虫有关的各种知识，包括：代码编写与调试、数据存储、浏览器操控。当你运用所学知识，采集完一个小型网站时，就将获得一种成就感——用代码完成了靠手工难以完成的工作。

爬虫，其实就是使用\ **HTTP**\ 协议通过网络访问服务器的资源。资源，主要分为静态文件和数据库中的记录，而用户主要使用\ **HTTP**\ 的\ ``get``\ 与\ ``post``\ 方法访问\ **URI**\ （资源）。网页页面大都是通过模板引擎加载数据库中的记录生成的，爬虫则是对这个过程的逆向还原。

编写爬虫的要点在于模拟人的行为，可以使用\ Fiddler_\  抓包数据。\ **IP**\ 地址是无法作假的，正常人类是不可能从某一个\ **IP**\ 地址以超高频率访问网站的。为了应对网站所采取的反制手段（如：验证码），要么采用代理\ **IP**\ 服务，要么就降低采集频率。

.. footer::

    要想写好爬虫脚本，就得阅读\ Requests_\ 、\ BeautifulSoup_\ 的文档和学习Web开发技术（如：\ Django_\ ）。

.. _Python: https://www.python.org/
.. _Fiddler: https://www.telerik.com/fiddler
.. _Requests: http://python-requests.org/
.. _BeautifulSoup: https://www.crummy.com/software/BeautifulSoup/bs4/doc/
.. _Django: https://docs.djangoproject.com/
