class ProfileJob < ApplicationRecord
    belongs_to :job
    belongs_to :profile
end
