require "redd"

module RedditToBook
  def self.generate_askreddit
    generate('Askreddit')
  end

  private

  def self.generate(subreddit)
    askreddit = client.subreddit(subreddit)
    top_posts = []

    comments_of_top_post = []
    post = askreddit.top.first

    post.comments.each do |c|
      begin
        comments_of_top_post << c.body.encode("Windows-1252").force_encoding("UTF-8")
      rescue
        puts "Tried to get a body that doesen't exist"
      end
    end

    i = 0
    # File would be a hash of the subreddit on current day
    # If it exists we would load that first?
    file = File.new("./#{subreddit} #{Time.now}.html", 'w')
    file.write("<h1> #{post.title.encode("Windows-1252").force_encoding("UTF-8")} </h1>")
    file.write("<body>")
    file.write("<p> #{post.title.encode("Windows-1252").force_encoding("UTF-8")} </p>")
    file.write("</body>")
    
    while comments_of_top_post[i]
      file.write("<body>")
      file.write(comments_of_top_post[i])
      file.write("<br><br> ===*=== <br><br>")
      file.write("</body>")
      i += 1
    end
    
    return file
    # system("cd mybook && kitabu export")
  end

  def self.client
    @r ||= Redd.it(
      user_agent: 'Reddit to Book',
      client_id:  '596caC4b5G5vzQ',
      secret:     '9nH7IYZmCbPBM1nmc5Y0x1aAfaA'
    )
  end
end
