require('time')

desc "Create a new post"
task :post do
  dir = ENV['dir']
  unless FileTest.directory?("_#{dir}")
    system("mkdir _#{dir}")
  end
  title = ENV['title']
  begin
    datetime = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d %H:%M:%S %z')
    date = datetime.split.first
  rescue Exception => e
    puts "Error: date format must be YYYY-MM-DD!"
    exit -1
  end

  filename = File.join('.', "_#{dir}", (dir == 'posts') ? "#{date}-#{title}.rst" : "#{title}.rst")
  if File.exist?(filename)
    abort("rake aborted: #{filename} already exists.")
  end
  puts "Creating new post: #{filename}..."
  open(filename, 'w') do |post|
    post.puts <<EOF
---
title: #{title}
date: #{datetime}
categories: 
tags: []
gist: 
excerpt_separator: .. 摘要注释
---

.. container:: excerpt



.. 摘要注释

EOF
  end
end

desc "在 Travis CI 环境下更新 git submodules"
task :submodules_update do
  text = File.read('.gitmodules').gsub(/git@gist.github.com:/,'https://gist.github.com/')
  File.write('.gitmodules', text)
  system('git submodule update --init --recursive')
end

desc "在 Travis CI 环境下，构建_site目录并推送到master分支"
task :push_site do
  system <<EOF
cd _site && \
git config --global user.email $email && \
git config --global user.name $name && \
git init && \
git remote add origin https://$token@github.com/$name/$name.github.io.git && \
git add . && \
git commit -m "Travis CI $(date +%Y-%m-%d/%T)" && \
git push -f origin master
EOF
end

