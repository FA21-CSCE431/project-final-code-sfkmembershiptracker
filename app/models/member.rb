class Member < ApplicationRecord
    belongs_to :user, foreign_key: "email", class_name: "User"
    belongs_to :position
    has_many :participants
    has_many :events, :through => :participants
end
