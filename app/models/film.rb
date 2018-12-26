class Film < ApplicationRecord
    has_many :lists
    has_many :artists, through: :lists, source: :listable,
        source_type: "Artist"
    has_many :directors, through: :lists, source: :listable,
        source_type: "Director"
    has_many :categories, through: :lists, source: :listable,
        source_type: "Category"
    has_many :studios, through: :lists, source: :listable,
        source_type: "Studio"
    has_many :countries, through: :lists, source: :listable,
        source_type: "Country"

    def add_category category
        categories << category
    end

    def remove_category category
        categories.delete category
    end

    def category_exist? category
        categories.include? category
    end

    def add_artist artist
        artists << artist
    end

    def remove_artist artist
        artists.delete artist
    end

    def artist_exist? artist
        artists.include? artist
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

    def add_country country
        countries << country
    end

    def remove_country country
        countries.delete country
    end

    def country_exist? country
        countries.include? director
    end
end
