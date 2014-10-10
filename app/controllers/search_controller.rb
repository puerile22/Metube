class SearchController < ApplicationController

  def show
    binding.pry
    query = params[:query].gsub(' ','%20')
    response = RestClient.get "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{query}&maxResults=10&key=#{ENV['youtube_api_key']}"
    render json: response
  end

end
