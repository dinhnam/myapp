class CategoriesController < ApplicationController
  def show
    @feature = Category.find_by(name: params[:name])
    if @feature
      @films = @feature.films.all
      @films = filter @films
      
      render 'films/index'
    else
      render 'films/not_found'
    end
  end
end
