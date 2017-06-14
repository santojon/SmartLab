class Equipment < ApplicationRecord
	belongs_to :desk
	
	has_one :user
	has_one :use, through: :user
end
