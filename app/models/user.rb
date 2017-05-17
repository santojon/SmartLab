class User < ApplicationRecord
	has_many :tokens, dependent: :destroy

	has_many :accesses
	has_many :desks, through: :accesses
end
