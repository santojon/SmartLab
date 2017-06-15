class User < ApplicationRecord
	has_many :accesses
	has_many :desks, through: :accesses
	
	has_many :incidents
	
	belongs_to :equipment
	has_one :use
	
	devise :database_authenticatable, :validatable
	
	def to_s
	    name
	end
end
