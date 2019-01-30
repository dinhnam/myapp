class FilmsController < ApplicationController
  def index
    @films = Film.all.page(params[:page]).per(15)
  end

  def show
    @film = Film.find_by_pretty_param params[:pretty_param]
    if @film
      @episodes = @film.episodes.order(number: :desc).limit(3)
    else
      render html: "not found"
    end
  end

  def new
    @film = Film.new
    @film.episodes.build
  end

  def create
    @film = Film.create film_params
    if @film
      @film.pretty_param = @film.name.gsub(/[, .]/,'-') + "-" + SecureRandom.hex(2)
      @film.rate = Rate.new
      @film.view = View.new
      @film.save
      redirect_to @film
    else
      flash[:danger] = "Film creation failed"
      render 'new'
    end
  end
  
  private

    def film_params
      params.require(:film).permit(:name, :duration, :release, :total_episodes, 
      :quality, :status, :description, :pictures, episodes_attributes:
      [:name, :number, :link])
    end

    def picture_size
      if picture.size > 2.megabytes
        flash[:danger] =  "Picture should be less than 2MB"
      end
    end
end
