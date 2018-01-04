require "redd"

module RedditToBook
  def self.generate_askreddit
    generate('Askreddit')
  end

  def self.generate_writing_prompt
    generate('WritingPrompts')
  end

  private

  def self.generate(subreddit)
    askreddit = client.subreddit(subreddit)
    top_posts = []

    comments_of_top_post = []
    post = askreddit.top.first

    post.comments.each do |c|
      begin
        comments_of_top_post << c.body
      rescue
        puts "Tried to get a body that doesen't exist"
      end
    end

    i = 0
    # File would be a hash of the subreddit on current day
    # If it exists we would load that first?
    file = File.new('./top.txt', 'w')
    file.write("#{post.title} \n\n\n")
    while comments_of_top_post[i]
      file.write(comments_of_top_post[i])
      file.write("\n\n ===*=== \n\n")
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
