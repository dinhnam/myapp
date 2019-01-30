module CommentsHelper
  def check_time comment
    since = ((Time.now - comment.created_at.localtime)/60).round(0)
    date = since.to_s + " minute ago"
    if since > 60
      since = since/60
      date = since.to_s + " hour ago"
      if since > 24
        since = since/24
        date = since.to_s + " day ago"
        if since > 30
          since = since/30
          date = since.to_s + " month ago"
          if since > 12
            since = since/12
            date = since.to_s + " year ago"
          end
        end
      end
    end
    return date
  end
end
