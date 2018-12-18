class Director < Feature
    has_many :lists, ->{ where listable_type: "Director"},
      :foreign_key => "listable_id", dependent: :destroy
    has_many :films, through: :lists
      
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
