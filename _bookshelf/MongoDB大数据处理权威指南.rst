---
title: MongoDB大数据处理权威指南
date: 2019-07-26 08:43:55 +0800
categories: 计算
tags: [MongoDB, 数据库, NoSQL]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    没有模式与\ *SQL*\ ，却有对象与方法。

.. 摘要注释

学习（入门）\ MongoDB_\ ，有本书足矣。本书的内容非常全面，涉及：\ CRUD_\ 与\ `聚合`_\ 、\ `备份`_\ 与\ `恢复`_\ 、用户认证、\ `索引`_\ 调优、\ `复制`_\ 与\ `分片`_\ ……

MongoDB_\ 没有提供\ *DSL*\ ，而是在\ `mongo Shell`_\ 或\ Drivers_\ 中定义对象，用\ `方法`_\ 与\ `操作符`_\ （声明式地）操作数据库。作为一个键值型数据库，\ MongoDB_\ 将键映射到值。在方法中，键可以是文档中的字段，也可以是操作符。聚合，就是让数据流过\ **过滤器（filter）**\ 、\ **枚举器（map）**\ 、\ **累积器（reduce）**\ 。

文摘
----

MongoDB_\ 中的聚合框架代表着在集合的数据上执行匹配、分组和转换操作的能力。它将通过创建聚合操作的管道流来实现，这些聚合操作将在数据上依次执行，后面的操作都将基于之前的结果执行。

Map-Reduce_\ 将对指定的集合执行一个专门的查询，所有匹配该查询的文档都将被输入到\ ``map``\ 函数中，\ ``map``\ 函数被设计用于生成键/值对，任何含有多个值的键都将输入到\ ``reduce``\ 函数中，\ ``reduce``\ 函数将返回输入数据的聚集结果。

.. _MongoDB: https://www.mongodb.com/
.. _CRUD: https://docs.mongodb.com/manual/crud/
.. _`聚合`: https://docs.mongodb.com/manual/aggregation/
.. _`备份`: https://docs.mongodb.com/manual/reference/program/mongodump/
.. _`恢复`: https://docs.mongodb.com/manual/reference/program/mongorestore/
.. _`索引`: https://docs.mongodb.com/manual/indexes/
.. _`复制`: https://docs.mongodb.com/manual/replication/
.. _`分片`: https://docs.mongodb.com/manual/sharding/
.. _`mongo Shell`: https://docs.mongodb.com/manual/mongo/
.. _Drivers: https://docs.mongodb.com/ecosystem/drivers/
.. _`方法`: https://docs.mongodb.com/manual/reference/method/
.. _`操作符`: https://docs.mongodb.com/manual/reference/operator/
.. _Map-Reduce: https://docs.mongodb.com/manual/core/map-reduce/
