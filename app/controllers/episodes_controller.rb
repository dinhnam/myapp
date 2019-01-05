class EpisodesController < ApplicationController
  def show
    @film = Film.find_by_pretty params[:film_pretty]
    @episodes = @film.episodes.all.order number: :asc
    @episode = @film.episodes.find_by_number params[:number]
    @comments = @episode.comments.all
  end
  
  def index
    
  end
  
  def new
    
  end

  def create
    
  end

  def update
    
  end
end
