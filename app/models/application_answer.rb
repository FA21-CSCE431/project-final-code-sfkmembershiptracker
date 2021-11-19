require 'uri'

class ApplicationAnswer < ApplicationRecord
	validates :question, presence:true
  validates :member_email, uniqueness: { scope: :question }, format: { with: URI::MailTo::EMAIL_REGEXP } 
  belongs_to :member, foreign_key: 'member_email', class_name: 'Member', optional: true
end
