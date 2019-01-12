class FilmsController < ApplicationController
  def index
    @films = Film.all.page(params[:page]).per(15)
  end

  def show
    @top_films = top_films :day, 10
    @film = Film.find_by_pretty_param params[:pretty_param]
    if @film
      @rate = @film.rate
      @comments = @film.comments.all
      @episode_first = @film.episodes.first
      @episodes_last = @film.episodes.all.order(number: :desc).limit 2
    elsif
      flash[:danger] = "Film not found"
      redirect_to root_url
    end
  end
end
