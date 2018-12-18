class Film < ApplicationRecord
    has_many :lists
    has_many :actors, through: :lists, source: :listable,
        source_type: "Actor"
    has_many :directors, through: :lists, source: :listable,
        source_type: "Director"
    has_many :categories, through: :lists, source: :listable,
        source_type: "Category"
    has_many :studios, through: :lists, source: :listable,
        source_type: "Studio"

    def add_category category
        categories << category
    end

    def remove_category category
        categories.delete category
    end

    def category_exist? category
        categories.include? category
    end

    def add_actor actor
        actors << actor
    end

    def remove_actor actor
        actors.delete actor
    end

    def actor_exist? actor
        actors.include? actor
    end

    def add_studio studio
        studios << studio
    end

    def remove_studio studio
        studios.delete studio
    end

    def studio_exist? studio
        studios.include? studio
    end

    def add_director director
        directors << director
    end

    def remove_director director
        directors.delete film
    end

    def director_exist? director
        directors.include? director
    end
end
