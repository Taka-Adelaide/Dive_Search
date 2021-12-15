class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    gon.spots = @spots

    @areas = Area.all


  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot

    @comments = @spot.comments.all
    @user = current_user

    
  end
end

# spot_index地域から検索のview元コード（ここに避難）
# <% @areas.each do |area| %>
# <%= area.name %>
# <% area.spots.each do |spot| %>
# <%= link_to spot_path(spot.id) do %>
# <%= spot.name %>
# <% end %>
# <% end %>
# <% end %>