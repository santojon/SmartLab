class User < ApplicationRecord
	has_many :tokens, dependent: :destroy

	has_many :accesses
	has_many :desks, through: :accesses
	
	devise :database_authenticatable, :validatable
end
