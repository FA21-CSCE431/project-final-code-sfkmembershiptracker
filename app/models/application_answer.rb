require 'uri'

class ApplicationAnswer < ApplicationRecord
	validates :question, presence:true
	validates :answer, presence:true
  validates :member_email, uniqueness: { scope: :question }, format: { with: URI::MailTo::EMAIL_REGEXP } 
  belongs_to :member, optional: true
end
