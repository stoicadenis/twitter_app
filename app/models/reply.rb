class Reply < ApplicationRecord
	belongs_to :user
	belongs_to :posts

	validates :message, presence:true, length: { maximum: 120 }
	validates  :user_id, presence: true
	validates  :post_id, presence: true
end
