class Desk < ApplicationRecord
	belongs_to :lab, optional: false
	has_many :equipments, :dependent => :destroy

	has_many :accesses
	has_many :users, through: :accesses
	
	def to_s
	    name
	end
end
