class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  require 'open-uri'
  get '/movies' do
   Movie.all.to_json

  end

  get '/movies/:id' do
   Movie.find(params[:id])
  end
  post '/movies' do
   movie=Movie.create(params)
   if movie.save
    status 201
    else status 400
   end
 end

  delete '/movies/:id' do
   movie=Movie.find(params[:id])
   if movie.destroy
    status 200
    else
    status 400
   end 
 end

  get '/movies/:id/reviews'do
   movie=Movie.find(params[:id])
   movie.reviews.to_json
  end

delete '/movies'do
Movie.destroy_all
end

delete "/reviews/:id"do

Review.find(params[:id].destroy)
end

get '/reviews' do
Review.all.to_json
end
  post '/movies/:id/reviews' do
   movie=Movie.find(params[:id])
   review=movie.reviews.build(content:params[:review])
   if review.save
    status 201
    {review:review}.to_json
    else status 400
      {error:"Failed to save review"}.to_json
   end
  end
end