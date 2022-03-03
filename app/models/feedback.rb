class Feedback < ApplicationRecord

  validates :email, presence: true
  validates :body, presence: true

end
