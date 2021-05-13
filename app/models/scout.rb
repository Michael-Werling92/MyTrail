class Scout < ApplicationRecord
    has_secure_password

    has_many :badges

    has_many :trips

    has_many :scout_badges
    has_many :badges, through: :scout_badges






    accepts_nested_attributes_for :trips




    validates :username, presence: true, uniqueness: true 

end
