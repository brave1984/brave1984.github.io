---
title: “笨办法”学Python
date: 2018-10-22
categories: 计算
tags: [Python, 基础]
excerpt_separator: .. 摘要注释

---
.. container:: summary

    去年，本书教会我粗浅但实用的命令行命令；今年，重读本书，作者谈了一些编程经验，如：“单元测试”、语言的学习方法。

.. 摘要注释

书中的示例代码几乎都是写入文件，并作为脚本运行。作为编程初学者，你不应该使用\ **IDE**\ 来编写代码，代码补全对你尤其有害。每个字母的敲击，都能够加深你对代码示例的理解。当然，遇到不懂之处，请别忘了从\ **交互式解释器**\ 中寻求\ ``help()``\ 。

文摘
----

编程语言这东西并不重要，重要的是你用这些语言做的事情。语言的真正目的——作为你的工具来实现有趣的事情。

编程作为一项智力活动，是唯一一种能让你创建交互式艺术的艺术形式。

实用命令
~~~~~~~~

+----------+---------------------+-------------------------------+
| Linux    | Windows             | 含义                          |
+==========+=====================+===============================+
|pwd       | pwd                 | 打印工作目录                  |
+----------+---------------------+-------------------------------+
| hostname | hostname            | 电脑在网络中的名称            |
+----------+---------------------+-------------------------------+
| mkdir    | mkdir               | 创建路径                      |
+----------+---------------------+-------------------------------+
| cd       | cd                  | 更改路径                      |
+----------+---------------------+-------------------------------+
| ls       | ls                  | 列出路径下的内容              |
+----------+---------------------+-------------------------------+
| touch    | New-Item -type file | 创建空文件                    |
+----------+---------------------+-------------------------------+
| rmdir    | rmdir               | 删除路径                      |
+----------+---------------------+-------------------------------+
| pushd    | pushd               | 推入路径                      |
+----------+---------------------+-------------------------------+
| popd     | popd                | 弹出路径                      |
+----------+---------------------+-------------------------------+
| cp       | cp                  | 复制文件或路径                |
+----------+---------------------+-------------------------------+
|          | robocopy            | 更可靠的复制命令              |
+----------+---------------------+-------------------------------+
| mv       | mv                  | 移动文件或路径                |
+----------+---------------------+-------------------------------+
| less     | more                | 逐页浏览文件                  |
+----------+---------------------+-------------------------------+
| cat      | type                | 打印输出整个文件              |
+----------+---------------------+-------------------------------+
| xargs    |                     | 执行参数                      |
+----------+---------------------+-------------------------------+
|          | forfiles            | 在一大堆文件上面运行一条命令  |
+----------+---------------------+-------------------------------+
| find     | dir -r              | 寻找文件                      |
+----------+---------------------+-------------------------------+
| grep     | select-string       | 在文件中查找内容              |
+----------+---------------------+-------------------------------+
| man      | help                | 阅读手册                      |
+----------+---------------------+-------------------------------+
| apropos  | helpctr             | 寻找恰当的手册页面            |
+----------+---------------------+-------------------------------+
| env      |                     | 查看你的环境                  |
+----------+---------------------+-------------------------------+
| echo     | echo                | 打印一些参数                  |
+----------+---------------------+-------------------------------+
| export   | set                 | 导出/设定一个新的环境变量     |
+----------+---------------------+-------------------------------+
| exit     | exit                | 离开shell                     |
+----------+---------------------+-------------------------------+
| sudo     | runas               | 成为超级用户或root，危险命令！|
+----------+---------------------+-------------------------------+
