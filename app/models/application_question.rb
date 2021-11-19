class ApplicationQuestion < ApplicationRecord
	validates :question, presence:true
end
