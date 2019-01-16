class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:name])
    if @category
    @films = @category.films.all.page(params[:page]).per(20)
    end
    render 'films/index'
  end
end
