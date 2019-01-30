class EpisodesController < ApplicationController
  def show
    @film = Film.find_by_pretty_param params[:film_pretty_param]
    @episode = @film.episodes.find_by_number params[:number]
    @comments = @episode.comments
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
