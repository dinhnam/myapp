class DirectorsController < ApplicationController
  def show
    @feature = Director.find_by(name: params[:name])
    if @feature 
      @films = @feature.films.all.page(params[:page]).per(20)
      render 'films/index'
    else
      render 'films/not_found'
    end
  end
end
