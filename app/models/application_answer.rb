class ApplicationAnswer < ApplicationRecord
  validates_uniqueness_of :member_email, :scope => :question
end
