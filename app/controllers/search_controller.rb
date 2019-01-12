class SearchController < ApplicationController
  def suggest
    @results = []
    film = Film.search(name_cont: params[:search]).result
    @results += film.to_a
    features = Feature.search(name_cont: params[:search]).result
    @results += features.to_a

    if @results.empty?
      render 'no_found', layout: false
    else
      render 'suggest', layout: false
    end
  end

  def index
    @films = Film.search(name_cont: params[:search]).result.page(params[:page]).per(15)
    render 'films/index'
  end

  def filter
    genres = Category.search(id_in: params[:genres]).result
    films = Film.all
    genres.each do |genre|
      films = films & genre.films
    end
    ids = films.map(&:id)
    @films = Film.where(id: ids).page(params[:page]).per(15)
    render 'films/index'
  end
end
