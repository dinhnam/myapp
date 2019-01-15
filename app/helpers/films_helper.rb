module FilmsHelper
  def filter genre_params
    films = Film.joins(:categories)
    genre_params.each do |genre_id|
      films = films.where(features: {id: genre_id})
    end
    return films
  end
end
