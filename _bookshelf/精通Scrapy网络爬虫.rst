---
title: 精通Scrapy网络爬虫
date: 2019-07-20 22:14:22 +0800
categories: 计算
tags: [Python, 爬虫, Scrapy]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    查看\ Scrapy_\ 的源码，探究类的公共接口。

.. _Scrapy: https://scrapy.org/

.. 摘要注释

从“用”的角度来说，\ Scrapy_\ 被作者讲明白了。本书的主题有两个：一、常用类的公共接口（爬虫编写）；二、中间件与插件（登录验证、动态加载、HTTP代理、数据存储、以及分布式）。

.. image:: https://doc.scrapy.org/en/latest/_images/scrapy_architecture_02.png

\ Scrapy_\ 由6大组件（Engine、Scheduler、Downloader、Middleware、Spider、Pipeline）与3种数据对象（Request、Response、Item）构成。

作为一个用户，你须熟知\ Item_\ 、\ Spider_\ 、\ CrawlSpider_\ 、\ Rule_\ 、\ LinkExtractor_\ 、\ Request_\ 、\ FormRequest_\ 、\ Response_\ 、\ Selector_\ 、\ ItemLoader_\ 、\ Pipeline_\ 等类的公共接口。

.. _Item: https://doc.scrapy.org/en/latest/topics/items.html#scrapy.item.Item
.. _Spider: https://doc.scrapy.org/en/latest/topics/spiders.html#scrapy.spiders.Spider
.. _CrawlSpider: https://doc.scrapy.org/en/latest/topics/spiders.html#scrapy.spiders.CrawlSpider
.. _Rule: https://doc.scrapy.org/en/latest/topics/spiders.html#scrapy.spiders.Rule
.. _LinkExtractor: https://doc.scrapy.org/en/latest/topics/link-extractors.html#scrapy.linkextractors.lxmlhtml.LxmlLinkExtractor
.. _Request: https://doc.scrapy.org/en/latest/topics/request-response.html#scrapy.http.Request
.. _FormRequest: https://doc.scrapy.org/en/latest/topics/request-response.html#scrapy.http.FormRequest
.. _Response: https://doc.scrapy.org/en/latest/topics/request-response.html#scrapy.http.Response
.. _Selector: https://doc.scrapy.org/en/latest/topics/selectors.html#scrapy.selector.Selector
.. _ItemLoader: https://doc.scrapy.org/en/latest/topics/loaders.html#scrapy.loader.ItemLoader
.. _Pipeline: https://doc.scrapy.org/en/latest/topics/item-pipeline.html#writing-your-own-item-pipeline
