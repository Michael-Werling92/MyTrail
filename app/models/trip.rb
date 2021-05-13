class Trip < ApplicationRecord
    belongs_to :scout, optional: true
    validates :location, :date, presence: true
end
