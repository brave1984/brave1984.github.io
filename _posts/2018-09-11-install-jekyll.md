---
layout: post
title: "install jekyll"
date: 2018-09-11 10:08:00 +0800
categories:
---

当将[Ruby](https://www.ruby-lang.org/zh_cn/)安装到：*D:\Program Files\Ruby\Ruby25-x64*时，由于路径名中包含有“空格”，这将导致安装[Jekyll](https://www.jekyll.com.cn/)时*make*失败，所以将*Ruby*改为：*D:\Languages\Ruby\Ruby25-x64*即可。

$`gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/`

$`gem sources -l`

$`gem install jekyll bundler`

$`bundle config mirror.https://rubygems.org https://gems.ruby-china.com`

$`jekyll _3.8.3_ new mysite`

$`cd mysite`

$`bundle install`

$`bundle exec jekyll serve`