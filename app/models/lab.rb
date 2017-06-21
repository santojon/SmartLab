class Lab < ApplicationRecord
	has_many :desks, :dependent => :destroy
	
	def to_s
	    name
	end
end
