class User < ApplicationRecord
	has_many :accesses
	has_many :desks, through: :accesses
	
	belongs_to :equipment
	
	has_many :incident
	
	devise :database_authenticatable, :validatable
	
	def to_s
	    name
	end
end
