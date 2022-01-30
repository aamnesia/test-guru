module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_name = repo.blank? ? author : repo
    link_to link_name, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type)
    content_tag(:p, flash[type], class: "flash #{type}") if flash[type]
  end
end
