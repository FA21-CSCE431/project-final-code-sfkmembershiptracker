class Member < ApplicationRecord
    belongs_to :user, foreign_key: "email", class_name: "User"
    belongs_to :position
end
