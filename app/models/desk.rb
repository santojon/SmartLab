class Desk < ApplicationRecord
	belongs_to :lab, optional: false
<<<<<<< HEAD
	has_many :equipments, :dependent => :delete_all
=======
	has_many :equipments, :dependent => :destroy
>>>>>>> master

	has_many :accesses
	has_many :users, through: :accesses
	
	def to_s
	    name
	end
end
