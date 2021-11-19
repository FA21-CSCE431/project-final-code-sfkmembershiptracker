class SfkInfo < ApplicationRecord
  validates :mission, presence: true
  validates :history, presence: true
	validates :ig_link, presence:true
	validates_format_of :ig_link, :with => /\A[A-Za-z0-9 ]*\z/
end
