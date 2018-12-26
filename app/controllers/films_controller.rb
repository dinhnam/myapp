class FilmsController < ApplicationController
  def index
  end
  def show
    @film = Film.find_by id: params[:id]
  end
end
