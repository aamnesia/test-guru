class BadgesController < ApplicationController

  def index
    @badges = Badge.all
    @own_badges = current_user.badges
  end

end
