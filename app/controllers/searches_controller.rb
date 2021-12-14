class SearchesController < ApplicationController
  def search
    @spots = Spot.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
end
