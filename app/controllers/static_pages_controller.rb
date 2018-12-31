class StaticPagesController < ApplicationController
  def home
    @top_film = Film.order(all_views: :desc).limit(5)
    @films = Film.all.page(params[:page]).per(12)
  end
end
