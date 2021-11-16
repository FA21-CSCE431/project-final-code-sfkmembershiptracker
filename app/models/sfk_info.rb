class SfkInfo < ApplicationRecord
  validates :mission, presence: true
  validates :history, presence: true
end
