require 'date'

class Event < ApplicationRecord
  validates :name, presence: true
  validates :event_type, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :points, presence: true, numericality: true
  validates :confirmation_code, presence: true

  has_many :participants, foreign_key: 'event_id', class_name: 'Participation', dependent: :destroy
  has_many :members, through: :participants
end
