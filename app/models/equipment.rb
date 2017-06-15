class Equipment < ApplicationRecord
	belongs_to :desk, optional: false
	has_one :user
end
