# app.rb
require 'sinatra'
require 'byebug'
require './lib/reddit_convert.rb'

get '/' do 
  erb :index
end

get '/hello/:name' do
  "Hello #{params['name']}!"
end

# Starts job to generate book
post '/generate_askreddit' do 
  # reddit_link = params['reddit_link']

  file = RedditToBook.generate_askreddit
  send_file(file, :disposition => 'attachment')
end

post '/generate_writing_prompt' do 
  # reddit_link = params['reddit_link']

  file = RedditToBook.generate_writing_prompt
  send_file(file, :disposition => 'attachment')
end

