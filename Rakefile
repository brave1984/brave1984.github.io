require('time')

desc "Create a new post"
task :post do
  unless FileTest.directory?('./_posts')
    system('mkdir _posts')
  end
  title = ENV['title']
  begin
    datetime = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d %H:%M:%S %z')
    date = datetime.split.first
  rescue Exception => e
    puts "Error: date format must be YYYY-MM-DD!"
    exit -1
  end
  filename = File.join('.', '_posts', "#{date}-#{title}.rst")
  if File.exist?(filename)
    abort("rake aborted: #{filename} already exists.")
  end
  puts "Creating new post: #{filename}..."
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "title: #{title}"
    post.puts "date: #{datetime}"
    post.puts "categories: "
    post.puts "tags: "
    post.puts "---"
  end
end