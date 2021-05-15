class ScoutBadge < ApplicationRecord
  belongs_to :scout
  belongs_to :badge
  validates :date, :scout_id, :badge_id, presence: true
end
