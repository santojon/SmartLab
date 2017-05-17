class Desk < ApplicationRecord
	belongs_to :lab
	has_many :equipments

	has_many :accesses
	has_many :users, through: :accesses
end
