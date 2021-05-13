class Badge < ApplicationRecord
    has_many :scout_badges
    has_many :scouts, through: :scout_badges
end
