class Trip < ApplicationRecord
    belongs_to :scout, optional: true
    validates :location, :date, presence: true

    scope :chrono, -> { order(date: :desc) }
end
