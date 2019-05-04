---
title: pytest测试实战
date: 2019-04-27 11:32:31 +0800
categories: 计算
tags: [python, 测试, 工具]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    pytest_\ ，能更好地完成测试，却只需要更少的代码。

.. _pytest: https://pytest.org

.. 摘要注释

\ pytest_\ 主要用于单元测试与功能测试，而本书的内容涵盖了它的基本用法，足以满足工程需要。结合优秀库的\ ``setup.py``\ 、\ ``setup.cfg``\ 文件，就能掌握工程的打包要诀。至于扩展\ pytest_\ ，则需要深入阅读文档与源码。

.. compound::

    从使用层面上看，\ pytest_\ 主要由\ *cli*\、\ ``assert``\  、\ ``mark``\ 、\ ``fixtrue``\ 、\ ``hook``\ 等部分构成。

    - \ *cli*\ ，提供了用例定位、格式化输出等功能。
    - \ pytest_\ 重写了\ ``assert``\ 关键字，不仅提升了易用性，而且还能输出更详细的错误信息。
    - \ ``mark``\ ，不仅能对用例进行分类，还可参数化测试。
    - \ ``fixtrue``\ ，作为一种依赖注入，解耦了测试的配置和逻辑，是\ pytest_\ 的核心。
    - \ ``hook``\ ，不仅将各个模块组合起来，还给用户留出了扩展接口。

从运行层面上看，\ pytest_\ 先读取配置信息，加载测试目录，将测试用例映射成节点并从下至上链接成树；然后运行测试循环，迭代测试用例，完成\ ``setup/call/teardown``\ ；最后汇总测试结果，生出测试报告。

.. compound::

    从源代码层面上看，\ pytest_\ 由一个入口文件\ ``pytest.py``\ 和一个组件包\ ``_pytest``\ 构成。

    - \ ``assertion``\ 组件重写了\ ``assert``\ 关键字；

    - \ ``Config``\ 类组合了一个\ ``PytestPluginManager``\ 类的实例，这个类是\ pluggy_\ 模块中\ ``PluginManager``\ 类的子类，从而实现了\ ``hook``\ 。

    - \ ``nodes.py``\ 文件中的节点类\ ``Node``\ 用\ ``property``\ 装饰了两个属性\ ``nodeid``\ 、\ ``ihook``\ 。\ ``ihook``\ 作为代理接口，用于把用例接入整个测试系统。

    - \ ``pytest.mark``\ 是\ ``MarkGenerator``\ 类的一个实例，从而实现了所谓的“单例模式”。通过类属性\ ``_config``\ 的布尔值，来判定是否拦截未注册的标记。\ ``__getattr__``\ 方法返回一个被\ attr_\ 模块的\ ``attrs``\ 函数装饰过的\ ``MarkDecorator``\ 类的实例，这个类的\ ``__call__``\ 方法很有意思——如果传入除用例以外的参数，那么将再返回一个\ ``MarkDecorator``\ 类的实例。

    - \ ``pytest.fixtrue``\ 函数返回一个\ ``FixtureFunctionMarker``\ 类的实例。\ ``FixtureRequest``\ 从用例节点中获取参数名，并转换为对应的\ ``FixtureDef``\ ，而它的子类\ ``SubRequest``\ 则由下至上地查找出所有的依赖项。

.. _attr: https://www.attrs.org/
.. _pluggy: https://github.com/pytest-dev/pluggy
