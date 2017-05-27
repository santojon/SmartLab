class Lab < ApplicationRecord
	has_many :desks
	
	def to_s
	    name
	end
end
