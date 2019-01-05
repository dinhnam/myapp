class FilmsController < ApplicationController
  def index
    @genre = Category.find_by name: params[:genre]

    if @genre
      @films = @genre.films.all.page(params[:page]).per(12)
      flash['info'] = @genre.name + ": " + @genre.description
    end
  end

  def show
    @film = Film.find_by_pretty params[:pretty]
    if @film
      @comments = @film.comments.all
      @episode_first = @film.episodes.first
      @episodes_last = @film.episodes.all.order(number: :desc).limit 3
    elsif
      flash[:danger] = "Film not found"
      redirect_to root_url
    end
  end
end
