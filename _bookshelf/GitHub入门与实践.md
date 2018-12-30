---
title: GitHub入门与实践
date: 2018-10-04
categories: 计算
tags: [Git, 基础]
---
## 文摘
### 初始化

$`git config --global user.name "username"`

$`git config --global user.email "email@example.com"`

$`git config --global color.ui.auto`

$`cat ~/.gitconfig`

$`ssh-keygen -t rsa -C "email@example.com"`

$`cat ~/.ssh/id_rsa.pub`

$`ssh -T git@github.com`

---
### 常用操作
$`git init`——初始化仓库

$`git status`——查看仓库的状态

$`git add`——向暂存区中添加文件

$`git commit`——保存仓库的历史记录

$`git log`——查看提交日志

$`git diff`——查看更改前后的差别

$`git branch`——显示分支一览表

$`git checkout`——创建、切换分支

$`git merge`——合并分支

$`git log --graph`——以图表形式查看分支

$`git reset`——回溯历史版本

$`git reflog`—— 查看操作日志

$`git rebase`——压缩历史

$`git remote add origin "git@github.com:username/repository.git"`——添加远程仓库

$`git push`——推送至远程仓库

$`git clone`——获取远程仓库

$`git pull`——获取最新的远程仓库分支

---
### 发送Pull Request

<div><img src="/bookshelf/{{ page.title }}/6-1.png" alt="send pull request" class="img-fluid" /></div>

❶ 在 GitHub 上进行 Fork

❷ 将❶的仓库 clone 至本地开发环境

❸ 在本地环境中创建特性分支

❹ 对特性分支进行代码修改并进行提交

❺ 将特性分支 push 到❶的仓库中

❻ 在 GitHub 上对 Fork 来源仓库发送 Pull Request

<div><img src="/bookshelf/{{ page.title }}/6-2.png" alt="fetch" class="img-fluid" /></div>

---
### 接收Pull Request
<div><img src="/bookshelf/{{ page.title }}/7-1.png" alt="clone & fetch" class="img-fluid" /></div>

<div><img src="/bookshelf/{{ page.title }}/7-2.png" alt="checkout & merge" class="img-fluid" /></div>

<div><img src="/bookshelf/{{ page.title }}/7-3.png" alt="merge pull request" class="img-fluid" /></div>

---
### Travis CI

$`gem install travis`

$`vi .travis.yml`

$`travis login`

