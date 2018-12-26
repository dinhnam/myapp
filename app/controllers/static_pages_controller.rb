class StaticPagesController < ApplicationController
  def home
    @films = Film.all.page(params[:page]).per(15)
  end
end
