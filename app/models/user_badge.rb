class UserBadge < ApplicationRecord

  belongs_to :user
  belongs_to :badge

  scope :by_rules, -> (rule, parameter) { joins(:badge).where(badges: { rule: rule, parameter: parameter }) }

end
