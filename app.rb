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
post '/generate' do 
  reddit_link = params['reddit_link']

  if reddit_link.empty?
    return 'No link specified!'
  end

  file = RedditToBook.generate(reddit_link)
  send_file(file, :disposition => 'attachment')
  return 'Success!'
end

