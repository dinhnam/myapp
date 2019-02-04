module FilmsHelper
  def filter films
    @genres = params[:genres]
    @sort = params[:sort]
    @status = params[:status]
    @year = params[:year]
    
    if @year
      if @year != "All"
        if @year == "1990.."
          films = films.where("release <= ?", 1990)
        else
          films = films.where release: @year.to_i
        end
      end
    end

    if @status
      case @status 
        when "finish"
          films = films.where status: "finish"
        when "unfinish"
          films = films.where status: "unfinish"
      end
    end

    if @sort
      case @sort
        when "0" 
          films = films.order_date_update
        when "1"
          films = films.order_view_type "year"
        when "2"
          films = films.order_rate
      end
    end

    if @genres
        @genres.each do |genre|
          films = films & Category.find_by_id(genre).films
      end
    end

    @count = films.count
    films = Kaminari.paginate_array(films).page(params[:page]).per(12)
    return films
  end
end
