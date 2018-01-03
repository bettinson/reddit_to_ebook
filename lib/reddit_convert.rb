require "redd"

r = Redd.it(:script, "CLIENT_ID", "SECRET", "Unidan", "hunter2", user_agent: "TestBot v1.0.0")

askreddit = r.subreddit_from_name("askreddit")
top_posts = []

comments_of_top_post = []
top = askreddit.get_top[0]
top.comments.each do |c|
  begin
    comments_of_top_post << c[:body]
  rescue
    puts "Tried to get a body that doesen't exist"
  end
end

i = 0
file = File.new('./mybook/text/top.md', 'w')
file.write("Top comments of the top post at the moment \n\n\n")
while comments_of_top_post[i]
  file.write(comments_of_top_post[i])
  file.write("\n\n ===*=== \n\n")
  i += 1
end

system("cd mybook && kitabu export")
