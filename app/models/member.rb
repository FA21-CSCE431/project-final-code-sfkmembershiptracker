class Member < ApplicationRecord
  belongs_to :user, foreign_key: 'email', class_name: 'User'
  belongs_to :position
  has_many :application_answers, foreign_key: 'member_email', class_name: 'ApplicationAnswer', dependent: :destroy
  has_many :participants, foreign_key: 'member_email', class_name: 'Participation', dependent: :destroy
  has_many :events, through: :participants

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true
  validates :phone, phone: { possible: true, allow_blank: true }
  validates :bio, presence: false
  validates :position_id, presence: true, numericality: true
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
