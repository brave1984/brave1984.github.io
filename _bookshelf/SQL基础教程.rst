---
title: SQL基础教程
date: 2018-10-19
categories: 计算
tags: [数据库, 基础]
excerpt_separator: .. 摘要注释
---
.. class:: excerpt

    一本对萌新友好的SQL书，阅读本书能掌握基本的SQL语句（SQL数据库的Create、Read、Update、Delete操作）。\
    本书的侧重在于Read操作，从简单的查询语句延伸到表与表之间的关联查询。

.. 摘要注释

----

文摘
----

\ **DDL**\ 数据定义语言：

    用来创建或者删除存储数据用的数据库以及数据库中的表等对象，包含：\ *CREATE*\ 、\ *DROP*\ 、\ *ALTER*\ 。

\ **DML**\ 数据操纵语言：

    用来查询或者变更表中记录，包含：\ *SELECT*\ 、\ *INSERT*\ 、\ *UPDATE*\ 、\ *DELETE*\ 。

\ **DCL**\ 数据控制语言：

    用来确认或者取消对数据库中的数据进行的变更，还可以对RDBMS的用户是否有权限操作数据库中的对象进行设定，\
    包含：\ *COMMIT*\ 、\ *ROLLBACK*\ 、\ *GRANT*\ 、\ *REVOKE*\ 。

SQL语句以分号(;)结尾、关键字不区分大小写、字符串和日期用单引号(')括起、单词以半角空格或换行分隔。

CREATE与SELECT子句
~~~~~~~~~~~~~~~~~~

======== ======== ======== ======== ======== ========
商品编号 商品名称 商品种类 销售单价 进货单价 登记日期
======== ======== ======== ======== ======== ========
0001     T恤衫    衣服     1000     500      2009-09-20
0002     打孔器   办公用品 500      320      2009-09-11
0003     运动T恤  衣服     4000     2800
0004     菜刀     厨房用具 3000     2800     2009-09-20
0005     高压锅   厨房用具 6800     5000     2009-01-15
0006     叉子     厨房用具 500               2009-09-20
0007     擦菜板   厨房用具 880      790      2008-04-28
0008     圆珠笔   办公用品 100               2009-11-11
======== ======== ======== ======== ======== ========

.. code:: postgres

    CREATE DATABASE shop;


.. code:: postgres

    CREATE TABLE product(
      product_id CHAR(4) NOT NULL,
      product_name VARCHAR(100) NOT NULL,
      product_type VARCHAR(32) NOT NULL,
      sale_price INTEGER,
      purchase_price INTEGER,
      regist_date DATE,
      PRIMARY KEY (product_id)
    );

.. code:: postgres

    INSERT INTO product VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20'),
                               ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11'),
                               ('0003', '运动T恤', '衣服', 4000, 2800, NULL),
                               ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20'),
                               ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15'),
                               ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20'),
                               ('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28'),
                               ('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');

.. code:: postgres

    SELECT DISTINCT product_type
      FROM product;

\ *DISTINCT*\ 关键字只能写在第一个列名之前，用以删除重复记录。

* 算术运算符：+、-、\*、/；
* 比较运算符：=、<>、>=、>、<=、<;
* 逻辑运算符：\ *NOT*\ 、\ *AND*\ 、\ *OR*\ 。

GROUP BY子句
~~~~~~~~~~~~

聚合函数：\ *COUNT*\ 、\ *SUM*\ 、\ *AVG*\ 、\ *MIN*\ 、\ *MAX*\ ，会排除字段值为\ *NULL*\ 的记录。

.. code:: postgres

    SELECT product_type,
           COUNT(product_type),
           current_date AS query_date
      FROM product
      WHERE product_type <> '衣服'
      GROUP BY product_type;

* 使用\ *GROUP BY*\ 子句时，\ *SELECT*\ 子句中不能出现聚合键之外的列名（只允许存在：常数、聚合函数、聚合键）；
* 在\ *GROUP BY*\ 子句中不能使用\ *SELECT*\ 子句中定义的别名；
* \ *GROUP BY*\ 子句结果的显示是无序的；
* 只有\ *SELECT*\ 子句和\ *HAVING*\ 子句（以及\ *ORDER BY*\ 子句）中能够使用聚合函数。

HAVING子句
~~~~~~~~~~
.. code:: postgres

    SELECT product_type,
           COUNT(product_type)
      FROM product
      GROUP BY product_type
      HAVING count(product_type) = 2;

\ *HAVING*\ 子句中只允许存在：常数、聚合函数、聚合键，但是聚合键所对应的条件不应该书写在\ *HAVING*\ 子句当中，而应该书写在\ *WHERE*\ 子句当中。

ORDER BY子句
~~~~~~~~~~~~

子句的书写顺序：1、\ *SELECT*\ 子句-->2、\ *FROM*\ 子句-->3、\ *WHERE*\ 子句-->4、\ *GROUP BY*\ 子句-->5、\ *HAVING*\ 子句-->6、\ *ORDER BY*\ 子句。

* 未指定\ *ORDER BY*\ 子句中排列顺序时会默认使用升序进行排列，\ *ASC*\ 和\ *DESC*\ 是ascendent（上升的）和descendent（下降的）这两个单词的缩写；
* 排序键中包含\ *NULL*\ 时，会在开头或末尾进行汇总；
* 在\ *ORDER BY*\ 子句中可以使用\ *SELECT*\ 子句中定义的别名；
* 在\ *ORDER BY*\ 子句中可以使用\ *SELECT*\ 子句中未使用的列和聚合函数。

INSERT子句
~~~~~~~~~~

.. code:: postgres

    INSERT INTO productcopy
      SELECT *
        FROM product
        WHERE product_type = '厨房用具';

* 通过在建表语句中设置\ *DEFAULT*\ 约束来设定默认值，省略\ *INSERT*\ 语句中的列名，就会自动设定为该列的默认值（没有默认值时会设定为\ *NULL*\ ）
* \ *INSERT*\ 语句的\ *SELECT*\ 语句中，可以使用\ *WHERE*\ 子句或者\ *GROUP BY*\ 子句等任何SQL语法（ 但使用\ *ORDER BY*\ 子句并不会产生任何效果）。

DELETE子句
~~~~~~~~~~
.. code:: postgres

    DELETE FROM productcopy
      WHERE product_type = '叉子';

\ *DELETE*\ 语句的删除对象并不是表或者列，而是记录（行）,可以通过\ *WHERE*\ 子句指定对象条件来删除部分数据。

.. code:: postgres

    TRUNCATE productcopy;

\ *TRUNCATE*\ 语句只能用于删除表中全部数据。

UPDATE子句
~~~~~~~~~~

.. code:: postgres

    UPDATE product
      SET sale_price = sale_price * 10,
          purchase_price = purchase_price / 2
      WHERE product_type = '厨房用具';

事务
~~~~

* 事务是需要在同一个处理单元中执行的一系列更新处理的集合。通过使用事务，可以对数据库中的数据更新处理的提交(\ *COMMIT*\ )和取消(\ *ROLLBACK*\ )进行管理；

* DBMS的事务具有原子性（Atomicity）、一致性（Consistency）、隔离性（Isolation）和持久性（Durability）四种特性。

子查询
~~~~~~

表中存储的是实际数据，而视图中保存的是从表中取出数据所使用的\ *SELECT*\ 语句，应该将经常使用的\ *SELECT*\ 语句做成视图，并避免在视图的基础上创建视图。

子查询作为内层查询会首先执行，标量子查询就是返回单一值的子查询。

.. code:: postgres

    SELECT product_type,
           product_name,
           sale_price
      FROM product AS p1
      WHERE sale_price > (SELECT AVG(sale_price)
                          FROM product AS p2
                          WHERE p1.product_type = p2.product_type
                          GROUP BY product_type);

关联子查询会在细分的组内进行比较时使用，结合条件一定要写在子查询中。

函数、谓词、CASE表达式
~~~~~~~~~~~~~~~~~~~~~~

函数可分为：

* 算术函数：+、-、\*、/、\ *ABS*\ 、\ *MOD*\ 、\ *ROUND*\ 等；
* 字符串函数：\|\|、\ *LENGTH*\ 、\ *LOWER*\ 、\ *UPPER*\ 、\ *REPLACE*\ 、\ *SUBSTRING*\ 等；
* 日期函数：\ *CURRENT_DATE*\ 、\ *CURRENT_TIME*\ 、\ *CURRENT_TIMESTAMP*\ 、\ *EXTRACT*\ 等；
* 转换函数：\ *CAST*\ 、\ *COALESCE*\ 等；
* 聚合函数。

谓词：\ *LIKE*\ 、\ *BETWEEN*\ 、\ *IS NULL*\ 、\ *IS NOT NULL*\ 、\ *IN*\ 、\ *EXISTS*\ (通常指定关联子查询作为\ *EXIST*\ 的参数)。

.. code:: postgres

    SELECT SUM(CASE WHEN product_type = '衣服'
                         THEN sale_price ELSE 0 END ) AS "衣服合计",
           SUM(CASE WHEN product_type = '厨房用具'
                         THEN sale_price ELSE 0 END ) AS "厨房用具合计",
           SUM(CASE WHEN product_type = '办公用品'
                         THEN sale_price ELSE 0 END ) AS "办公用品"
      FROM product;

表的加减法
~~~~~~~~~~

集合运算符：\ *UNION*\ （并集）、\ *INTERSECT*\ （交集）、\ *EXCEPT*\ （差集），以行为单位进行操作。集合运算符会除去重复的记录，使用\ *ALL*\ 选项，可以保留重复行。

联结：\ *INNER JOIN*\ （内联结）、\ *OUTER JOIN*\ （外联结），以列为单位对表进行操作。

* 进行联结时需要在\ *FROM*\ 子句中使用多张表；
* 进行内联结时必须使用\ *ON*\ 子句，并且要书写在\ *FROM*\ 和\ *WHERE*\ 之间；
* 使用联结时\ *SELECT*\ 子句中的列需要按照“<表的别名>.<列名>”的格式进行书写。