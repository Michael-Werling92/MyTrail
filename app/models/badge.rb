class Badge < ApplicationRecord
    has_many :scout_badges
    has_many :scouts, through: :scout_badges
    #not createable or editable- No validations needed#
end
