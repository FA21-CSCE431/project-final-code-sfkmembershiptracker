class User < ApplicationRecord
  validates :email, presence: true
  has_one :member, foreign_key: 'email', required: false
  has_one :position, through: :member
  accepts_nested_attributes_for :member

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :rememberable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    # return nil unless email =~ /@tamu.edu\z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
