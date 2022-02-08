module ApplicationHelper

  FLASH_KEYS = {  'alert' => :danger, 'notice' => :success }.freeze

  def flash_class(key)
    FLASH_KEYS[key] || :light
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_name = repo.blank? ? author : repo
    link_to link_name, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
