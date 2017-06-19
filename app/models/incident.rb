class Incident < ApplicationRecord
    belongs_to :user, optional: false
end
