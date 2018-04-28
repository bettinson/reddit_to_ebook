# app.rb
require 'sinatra'
require 'byebug'
require './lib/reddit_convert.rb'
require './lib/applicable_subreddits.rb'
require './lib/gen_ebook.rb'

get '/' do 
  erb :index
end

post '/generate' do 
  subreddit = params['subreddit']
  file = RedditToBook.generate(subreddit)
  kindle_file = GenerateMobi.generate(file)
  File.delete(file)
  send_file(kindle_file, :disposition => 'attachment')
  File.delete(kindle_file)
end
