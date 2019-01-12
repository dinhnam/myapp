module FilmsHelper
  def top_films date, per
    views = View.order("#{date}_views" => :desc).limit(per)
    films = []
    views.each do |view|
     films << view.film
    end
    return films
  end
end
