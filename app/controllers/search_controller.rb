class SearchController < ApplicationController
  def suggest
    res = []
    film = Film.search(name_cont: params[:search]).result
    res += film.to_a
    features = Feature.search(name_cont: params[:search]).result
    res += features.to_a
    @results = Kaminari.paginate_array(res).page(params[:page]).per(12)
    if @results.empty?
      render 'none', layout: false
    else
      render 'suggest', layout: false
    end
  end

  def index
    @search = params[:search]
    @films = Film.search(name_cont: @search).result
    @films = filter @films
    
    render 'films/index'
  end
  
end
