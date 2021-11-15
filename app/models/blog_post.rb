class BlogPost < ApplicationRecord
  validates :name, presence:true
  validates :position, presence:true
  validates :message, presence:true
end
