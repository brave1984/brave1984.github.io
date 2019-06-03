---
title: Ruby基础教程
date: 2019-05-26 08:23:27 +0800
categories: 计算
tags: [Ruby, 基础]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    Ruby_\ ，比\ Python_\ 更面向对象的脚本语言。

.. _Ruby: https://www.ruby-lang.org/
.. _Python: https://www.python.org/

.. 摘要注释

本书的内容过于基础，没有深入讲解对象模型、作用域、闭包。从\ Python_\ 而来的我，对\ Ruby_\ 语言还存有太多的疑惑。

通过阅读《\ `Ruby程序员修炼之道`_\ 》、《\ `Ruby元编程`_\ 》，我的疑惑才得以解开。虽然\ Ruby_\ 与\ Python_\ 同为一切皆是对象的动态语言，但是两者有太多的不同之处。\ Ruby_\ 中只有方法，没有“函数”这个概念；强制的命名约定，没有“内部作用域”这个概念；不一样的“模块”、不一样的\ ``self``\ ；可以增加或修改内置类的方法……

+--------------+----------+----------+--------+-------+
| Keywords     |          |          |        |       |
+==============+==========+==========+========+=======+
| __ENCODING__ | __LINE__ | __FILE__ | BEGIN  | END   |
+--------------+----------+----------+--------+-------+
| alias        | and      | begin    | break  | case  |
+--------------+----------+----------+--------+-------+
| class        | def      | defined? | do     | else  |
+--------------+----------+----------+--------+-------+
| elsif        | end      | ensure   | false  | for   |
+--------------+----------+----------+--------+-------+
| if           | in       | module   | next   | nil   |
+--------------+----------+----------+--------+-------+
| not          | or       | redo     | rescue | retry |
+--------------+----------+----------+--------+-------+
| return       | self     | super    | then   | true  |
+--------------+----------+----------+--------+-------+
| undef        | unless   | until    | when   | while |
+--------------+----------+----------+--------+-------+
| yield        |          |          |        |       |
+--------------+----------+----------+--------+-------+

.. footer::

  ruby-style-guide_\ 

.. _Ruby程序员修炼之道: https://amzn.to/2Xp42V9
.. _Ruby元编程: /bookshelf/Ruby元编程/
.. _ruby-style-guide: https://github.com/JuanitoFatas/ruby-style-guide
