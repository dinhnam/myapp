module CommentsHelper
  def count_comments film
    count = film.comments.count
    film.episodes.each do |episode|
      count += episode.comments.count
    end
    return count
  end
end
