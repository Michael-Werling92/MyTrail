class Trip < ApplicationRecord
    belongs_to :scout, optional: true
end
