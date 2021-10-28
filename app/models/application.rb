class Application < ApplicationRecord
    validates :first_name, presence: { message: " can't be blank" }
    validates :last_name, presence: { message: " can't be blank" }
    validates :email, presence: { message: " can't be blank" }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: { message: " can't be blank" }
    validates :grad_date, presence: { message: " can't be blank" }
    validates :question, presence: { message: " can't be blank" }
end
