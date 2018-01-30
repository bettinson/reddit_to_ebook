# app.rb
require 'sinatra'
require 'byebug'
require './lib/reddit_convert.rb'
require './lib/applicable_subreddits.rb'


get '/' do 
  erb :index
end

get '/hello/:name' do
  "Hello #{params['name']}!"
end

# Starts job to generate book
post '/generate' do 
  subreddit = params['subreddit']

  file = RedditToBook.generate(subreddit)
  send_file(file, :disposition => 'attachment')
end
