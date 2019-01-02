module FilmsHelper
  def average_rate data
    rate = JSON.parse(data)
    sum = rate["star_5"] + rate["star_4"] + rate["star_3"] + rate["star_2"] +
          rate["star_1"]
    sum_value = 5 * rate["star_5"] + 4 * rate["star_4"] + 3 * rate["star_3"] +
                2 * rate["star_2"] + rate["star_1"]

    (1.0 * sum_value / sum).round(1)
  end

  def set_rate star, film
    rate = JSON.parse(film.rate)
    case star
    when 1 then rate["star_1"] += 1
    when 2 then rate["star_2"] += 1
    when 3 then rate["star_3"] += 1
    when 4 then rate["star_4"] += 1
    when 5 then rate["star_5"] += 1
    end
    film.rate = JSON.generate rate
    film.save
  end
end
