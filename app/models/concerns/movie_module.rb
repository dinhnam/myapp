module MovieModule
    extend ActiveSupport::Concern

    def add_film film
        self.films << film
    end
  
    def remove_film film
        self.films.delete film
    end
  
    def film_exist? film
        self.films.include? film
    end
end
  