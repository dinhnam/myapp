class ApplicationController < ActionController::Base
  include SessionsHelper
  include CommentsHelper
  include FilmsHelper
  before_action :set_locale
  before_action :set_categories
  before_action :set_notices
  before_action :set_countries

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def set_categories
    @categories = Category.all
  end

  def set_notices
    @notices = Notice.all
  end

  def set_countries
    @countries = Country.all
  end

  def filter films
    @genres = params[:genres]
    @sort = params[:sort]
    @status = params[:status]
    
    if @status
      case @status 
        when "1"
          films = films.where status: "finish"
        when "2"
          films = films.where status: "unfinish"
      end
    end

    if @sort
      case @sort
        when "0" 
          films = films.order_date
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
