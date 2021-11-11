class Participant < ApplicationRecord
    belongs_to :event, foreign_key: "id", class_name: "Event"
    belongs_to :member, foreign_key: "email", class_name: "Member"
end
