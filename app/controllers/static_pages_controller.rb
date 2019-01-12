class StaticPagesController < ApplicationController
  def home
    @films = Film.all.page(params[:page]).per(15)
    @top_films = Film.favorite(:year).limit(10);
  end
end
