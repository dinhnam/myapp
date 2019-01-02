module MovieModule
  extend ActiveSupport::Concern

  def add_film film
    films << film
  end

  def remove_film film
    films.delete film
  end

  def film_exist? film
    films.include? film
  end
end
