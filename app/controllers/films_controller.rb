class FilmsController < ApplicationController
  def index
    @genre = Category.find_by name: params[:genre]
    @conutry = Country.find_by name: params[:country]

    if @genre
      @films = @genre.films.all.page(params[:page]).per(12)
      @note = @genre.name + ": " + @genre.description
    end

    if @conutry
      @films = @conutry.films.all.page(params[:page]).per(12)
      @note = "Phim sản xuất tại " + @conutry.name
    end
  end

  def show
    @film = Film.find_by id: params[:id]
    @episodes = @film.episodes.all.order number: :desc
    @episodes_last = @episodes.limit(3)

    if params[:ep]
      @episode_play = @episodes.find_by number: params[:ep]

      if @episode_play
        render :play
      elsif
        flash[:danger] = "film not found"
      end
    end
  end
end
