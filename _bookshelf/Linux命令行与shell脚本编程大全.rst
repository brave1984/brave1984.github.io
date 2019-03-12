---
title: Linux命令行与shell脚本编程大全
date: 2019-03-11 10:48:23 +0800
categories: 计算
tags: [GNU/Linux, Shell, 基础]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    践行\ **懒惰**\ 这一美德，用脚本自动化地完成繁琐的任务。

.. 摘要注释


.. epigraph::

    假舆马者，非利足也，而致千里；假舟楫者，非能水也，而绝江河。君子生非异也，善假于物也。

    不积跬步，无以至千里；不积小流，无以成江海。

    -- 荀子《劝学》

\ GNU_\ /\ Linux_\ 系统就是我们的工作台，利用\ *Shell*\ 命令，我们能将散布在台面上的各种工具整合起来。这些工具就如同函数一般小，正是由于功能的单一，我们才能通过管道将其复用。

虽然我们是在\ *GUI*\ 界面与专有软件的环境下成长的，但是作为一名操纵文本文件的程序员，如若不熟悉\ *Shell*\ ，那么就没法使一些人工作业转为自动化处理，更没法全面掌握语言中与系统操作相关的标准库（如：\ Python_\ 的\ *sys*\ 、\ *os*\ 、\ *signal*\ 等模块）。

\ Linux_\ 内核主要负责系统内存、软件程序、硬件设备、文件系统的管理。\ GNU_\  coreutils软件包由文件处理、文本操作、进程管理等工具构成。

学习\ GNU_\ /\ Linux_\ 系统，就在于理解\ **文件**\ 。程序是从文件中读写数据流（如：处理日志），而文件有主、组的归属，以及读、写、执行的权限。\ **文件系统**\ 管理着文件与目录，主要有\ *日志*\ 文件系统与\ *写时复制*\ 文件系统。文件系统与虚拟内存依托于硬盘（硬件设备），执行文件所生成的各类进程又要消耗CPU和内存等资源。

文摘
----

系统将硬件设备当成特殊的文件，称之为\ **设备文件**\ ，可分为：字符型设备文件、块设备文件、网络设备文件。

\ **逻辑卷管理**\ 的核心在于如何处理安装在系统上的硬盘分区，硬盘称作\ **物理卷**\ 。每个物理卷都会映射到硬盘上特定的物理分区，多个物理卷集中在一起可以形成一个\ **卷组**\ 。卷组提供了一个创建\ **逻辑卷**\ 的平台，逻辑卷提供了创建文件系统的分区环境。

\ **命令替换**\ 会创建一个\ *子Shell*\ 来运行对应的命令。外部命令，是存在于\ *Bash Shell*\ 之外的程序，执行时会\ **衍生**\ （forking）出一个子进程。

由\ **管道**\ 连接的命令会被系统同时运行，前一个命令的输出会被直接重定向到后一个命令的输入，数据传输不会用到任何中间文件或缓冲区。

退出状态码（exit status）是一个0～255的整数值，在命令结束运行时由命令传给\ *Shell*\ ，环境变量\ ``$?``\ 保存了上个已执行命令的退出状态码。

环境变量\ ``$#``\ 存有命令行参数的个数，环境变量\ ``$*``\ 将命令行参数当作一个单词，环境变量\ ``$@``\ 将命令行参数当作同一字符串中的多个独立的单词。默认情况下，\ ``shift``\ 命令会将命令行参数向左移动一个位置，参数被移除后，值就会被舍弃。

系统将每个对象当作文件处理，包括输入和输出进程，用\ **文件描述符**\ 来标识每个文件对象。文件描述符是一个非负整数，每个进程一次最多可以有九个文件描述符。\ *Bash Shell*\ 保留了前三个文件描述符（0、1和2），分别应对\ **STDIN**\ （标准输入流）、\ **STDOUT**\ （标准输出流）、\ **STDERR**\ （标准错误流）。\ *exec*\ 命令可用于打开文件描述符。

\ *kill*\ 命令用于向进程发送信号，\ *trap*\ 命令用于捕获信号。在命令后加个\ *&*\ 符就在后台运行进程，\ *nohup*\ 命令用于解除终端与进程的关联。启动、停止、终止以及恢复作业统称为\ **作业控制**\ ，\ *jobs*\ 命令用于查看\ *Shell*\ 中的作业。

Shell 语法
~~~~~~~~~~

\ **if语句**\ 会运行\ ``if``\ 后面的那个命令，若该命令的退出状态码是0，位于\ ``then``\ 部分的命令就会被执行；反之，则不执行。

若\ ``test``\ 命令中列出的条件成立，返回的退出状态码则为\ **零**\ ，否则，为\ **非零**\ 。\ ``test``\ 命令可以判断三类条件：\ **数值**\ 比较、\ **字符串**\ 比较、\ **文件**\ 比较。

.. code:: bash

    if command1 ; then
        commands
    elif commad2 ; then
        commands
    else
        commands
    fi

.. code:: bash

    case variable in
        pattern1 | pattern2)
            commands1 ;;
        pattern3)
            commands2 ;;
        *)
            default commands;;
    esac

\ **while语句**\ 可以定义多个测试命令，但只用最后一个测试命令的退出状态码来决定是否执行循环过程。内部字段分隔符（\ ``IFS``\ ）默认为：空格、制表符、换行符。\ ``break``\ 、\ ``continue``\ 可用于改变循环流程。

.. code:: bash

    for var in list ; do
        commands
    done


    while test command ; do
      other commands
    done


    until test command ; do
        other commands
    done

函数有两种定义格式，在运行结束时会返回一个退出状态码——默认，是函数中最后一条命令的退出状态码；显示，使用\ ``return``\ 返回一个0~255的退出状态码。

.. code:: bash

    function name {
        commands
    }

    name() {
        commands
    }

\ *Bash Shell*\ 会将函数当作小型脚本，函数调用只需像使用脚本那样地传递参数。当函数参数为数组变量时，需要在函数体内将环境变量\ ``$@``\ 重建为数组。函数可以进行\ **递归**\ 调用，使用\ ``source``\ 命令（别名：\ ``.``\ 号）引用\ **函数库**\ 文件。

.. footer::

    对于编写带有命令行选项的脚本，我个人更偏好于\ Python_\ 的\ Invoke_\ 、\ Fabric_\ 与\ Ruby_\ 的\ rake_\ 。

    附录A、\ *sed*\ 流编辑器很实用，推荐阅读：\ rbenv-installer_\ （\ rbenv_\ 的安装脚本）、\ get-docker.sh_\ （\ Docker_\ 的安装脚本）。

.. _GNU: http://www.gnu.org/
.. _Linux: https://www.kernel.org/
.. _Python: https://www.python.org/
.. _Invoke: https://www.pyinvoke.org/
.. _Ruby: https://www.ruby-lang.org/
.. _rake: https://github.com/ruby/rake
.. _Fabric: https://www.fabfile.org/
.. _rbenv: https://github.com/rbenv/rbenv
.. _rbenv-installer: https://github.com/rbenv/rbenv-installer/blob/master/bin/rbenv-installer
.. _Docker: https://www.docker.com/
.. _get-docker.sh: https://get.docker.com/
