# app.rb
require 'sinatra'

get '/' do 
  erb :index
end

get '/hello/:name' do
  "Hello #{params['name']}!"
end

# Starts job to generate book
post '/generate' do 
  #kindle_email = params['kindle_email']
  #user_email = params['user_email']
  reddit_link = params['reddit_link']

  unless reddit_link
    return 'No email!'
  end

  return reddit_link
end

