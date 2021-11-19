class Participation < ApplicationRecord
  belongs_to :event, foreign_key: 'event_id', class_name: 'Event', optional: true
  belongs_to :member, foreign_key: 'member_email', class_name: 'Member', optional: true

  validates :event, presence: true
  validates :user_code, presence: true
end
