class User < ApplicationRecord
	validates :name, :email, :gender, presence: true
	validates :age, numericality: { only_integer:true}, inclusion: { in: 0..100}
	validates :phone_number, numericality: { only_integer:true}, length: {minimum: 10}

	has_many :posts, dependent: :destroy
	has_many :replies, dependent: :destroy
	has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
	has_many :followed_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
	
	has_many :following, through: :follower_relationships, source: :followed
	has_many :followers, through: :followed_relationships
	has_secure_password

	def follow(other_user)
		following << other_user
	end

	def unfollow(other_user)
		following.delete(other_user)
	end

	def following?(other_user)
		following.include?(other_user)
	end
end
