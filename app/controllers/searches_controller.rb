class Api::V1::SearchesController < ApplicationController
  def get_shows
    q = params["searchTerm"]

    response = RestClient.get("https://www.episodate.com/api/search?q=#{q}&page=1")
    response_hash = JSON.parse(response)
    render json: response_hash
  end
end