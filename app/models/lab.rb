class Lab < ApplicationRecord
	has_many :desks, :dependent => :delete_all
	
	def to_s
	    name
	end
end
