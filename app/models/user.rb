class User < ApplicationRecord
	validates :name, :email, :gender, presence: true
	validates :age, numericality: { only_integer:true}, inclusion: { in: 0..100}
	validates :phone_number, numericality: { only_integer:true}, length: {minimum: 10}
end
