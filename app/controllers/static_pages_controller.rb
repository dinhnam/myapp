class StaticPagesController < ApplicationController
  def home
    @new_films = Kaminari.paginate_array(Film.order_date_update).page(params[:page]).per(9)
    @focus_films = Film.order_view_type(:month).limit(10);
    @top_view_films = Kaminari.paginate_array(Film.order_view_type("year"))
      .page(params[:page]).per(9)
  end

  def top
    @films = Kaminari.paginate_array(Film.order_view_type("year"))
      .page(params[:page]).per(20)
    render 'index'
  end

  def new
    @films = Kaminari.paginate_array(Film.order_date_update).page(params[:page])
                                                                       .per(20)
    render 'index'
  end
end
