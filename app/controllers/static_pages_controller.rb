class StaticPagesController < ApplicationController
  def home
    @new_films = Kaminari.paginate_array(Film.order_date).page(params[:page])
                                                                       .per(20)
    @top_films = Film.order_view_type(:month).limit(10);
  end
end
