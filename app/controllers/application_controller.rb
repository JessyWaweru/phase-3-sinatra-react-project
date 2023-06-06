class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  require 'open-uri'
 get '/api/breeds' do
  url='https://dog.ceo/api/breeds/list/all'
  response=open(url).read
  response
 end

 get '/api/breeds/:breed/images' do
   breed=params[:breed]
  url="https://dog.ceo/api/breed/#{breed}/images/random"
  response=open(url).read
  response
 end
end