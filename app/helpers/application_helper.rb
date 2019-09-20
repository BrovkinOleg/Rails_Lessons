module ApplicationHelper
  def current_year
    " --#{Time.current.year}-- "
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_messages
    flash.map do |key, msg|
      content_tag :p, msg, class: "flash #{key}"
    end.join.html_safe
  end
end
