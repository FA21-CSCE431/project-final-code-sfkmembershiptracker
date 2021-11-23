class SfkInfo < ApplicationRecord
  validates :mission, presence: true
  validates :history, presence: true
	validates :ig_link, presence:true
end
