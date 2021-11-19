require 'date'

class Event < ApplicationRecord
  validates :name, presence: true
  validates :event_type, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :points, presence: true, numericality: true
  validates :confirmation_code, presence: true

  has_many :participants, dependent: :nullify
  has_many :members, dependent: :nullify
end
