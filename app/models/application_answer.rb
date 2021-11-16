class ApplicationAnswer < ApplicationRecord
  validates :member_email, uniqueness: { scope: :question }
  belongs_to :member, optional: true
end
