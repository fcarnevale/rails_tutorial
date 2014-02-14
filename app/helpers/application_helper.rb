module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"

    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def request_stats
    { "request_stats" => 
      { "ip" => request.remote_ip, 
        "request" => request.request_method 
      } 
    }
  end
end
