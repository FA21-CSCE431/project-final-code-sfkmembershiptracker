require 'date'

class Event < ApplicationRecord
  validates :name, presence:true
  validates :event_type, presence:true
  validates :date, presence:true
  validates :location, presence:true
  validates :points, presence:true
  validates :confirmation_code, presence:true
end
