class Participation < ApplicationRecord
    belongs_to :event
    belongs_to :member, optional: true

    validates :event, presence: true
    validates :user_code, presence: true
end
