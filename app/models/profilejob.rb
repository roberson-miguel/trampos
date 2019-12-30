class Profilejob < ApplicationRecord
    validates :profile_id, :comment, presence: true
    validates :comment, length: { maximum: 200 }

    belongs_to :job
    belongs_to :profile, optional: true
end
