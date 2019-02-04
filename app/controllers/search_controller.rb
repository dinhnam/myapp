class SearchController < ApplicationController
  def suggest
    @results = []

    if params[:search]
      film = Film.ransack(name_cont: params[:search]).result
      @results += film.to_a
      feature = Feature.ransack(name_cont: params[:search]).result
      @results += feature.to_a
    end
    
    if params[:studio]
      res = Studio.ransack(name_cont: params[:studio]).result
      @results += res.to_a
    end

    if params[:country]
      res = Country.ransack(name_cont: params[:country]).result
      @results += res.to_a
    end

    if params[:director]
      res = Director.ransack(name_cont: params[:director]).result
      @results += res.to_a
    end

    if params[:artist]
      res = Artist.ransack(name_cont: params[:artist]).result
      @results += res.to_a
    end
   
    if @results.empty?
      render 'none', layout: false
    else
      render 'suggest', layout: false
    end
    
  end

  def index
    @search = params[:search]
    @films = Film.ransack(name_cont: @search).result
    @films = filter @films
    render 'films/index'
  end

  private

  def numeric? search
    return true if search =~ /\A\d+\Z/
    true if Float(search) rescue false
  end
end
