class Equipment < ApplicationRecord
	belongs_to :desk, optional: false
	belongs_to :user
end
