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
    @film = Film.new film_params
    if @film
      @film.pretty_param = @film.name.gsub(/[,. ?]/,'-') + SecureRandom.hex(2)
      @film.rate = Rate.new
      @film.view = View.new
      params[:film][:categories].each do |category|
        @film.categories << Category.find(category.to_i)
      end
      studio = Studio.find_by_name params[:studio]

      if studio
        @film.studios << studio
      end
      director = Director.find_by_name params[:director]

      if director
        @film.directors << director
      end
      country = Country.find_by_name params[:country]

      if country
        @film.countries << country
      end
      artist = Artist.find_by_name params[:artist]

      if artist
        @film.artists << artist
      end
      
      if @film.save
        flash[:success] = "Film creation success"
        redirect_to @film
      else
        flash[:danger] = "Film creation failed"
        render 'new'
      end
      
    end
  end

  def destroy
    @film = Film.find_by_pretty_param params[:pretty_param]
    if @film.destroy
      flash[:success] = "film delete success"
    end
    redirect_to root_url
  end
  
  private

    def film_params
      params.require(:film).permit(:name, :duration, :release, :total_episodes, 
        :quality, :status, :description, pictures: [],
          episodes_attributes: [:name, :number, :link])
    end

end
