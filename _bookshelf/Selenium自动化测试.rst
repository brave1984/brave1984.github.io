---
title: Selenium自动化测试
date: 2019-07-18 21:02:03 +0800
categories: 计算
tags: [Selenium, 测试, 工具]
gist: 
excerpt_separator: .. 摘要注释

---
.. container:: summary

    Selenium_\ ——用编程的方式模拟用户与浏览器的交互。

.. _Selenium: https://www.seleniumhq.org/

.. 摘要注释

作者结合\ Python_\ 的\ unittest_\ 模块，详细讲解了\ Selenium_ **API**\ 的使用方法。为了开发具有可维护性与可重用性的测试脚本，作者引入了\ *Page Object*\ 模式——在设计测试时，把元素和方法按照页面抽象出来，分离成一定的对象，然后再进行组织。

Selenium_\ 的\ **API**\ 被设计得简单易用，建模了\ WebDriver_\ 、\ WebElement_\ 、\ ActionChains_\ 、\ WebDriverWait_\ 等类。

相较于\ pytest_\ ，\ unittest_\ 显得过于复杂，而\ pytest-selenium_\ 是\ pytest_\ 的一个插件。

.. footer::

    《\ `Selenium 2自动化测试实战`_\ 》与本书有着相似的内容结构，可以对本书起到拾遗补阙的作用。

.. _Python: https://www.python.org/
.. _unittest: https://docs.python.org/dev/library/unittest.html
.. _WebDriver: https://github.com/SeleniumHQ/selenium/blob/master/py/selenium/webdriver/remote/webdriver.py
.. _WebElement: https://github.com/SeleniumHQ/selenium/blob/master/py/selenium/webdriver/remote/webelement.py
.. _ActionChains: https://github.com/SeleniumHQ/selenium/blob/master/py/selenium/webdriver/common/action_chains.py
.. _WebDriverWait: https://github.com/SeleniumHQ/selenium/blob/master/py/selenium/webdriver/support/wait.py
.. _pytest: https://pytest.org
.. _pytest-selenium: https://github.com/pytest-dev/pytest-selenium
.. _`Selenium 2自动化测试实战`: https://amzn.to/2JTUZWV
