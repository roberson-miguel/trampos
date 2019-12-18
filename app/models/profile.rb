class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :joblevel
  belongs_to :skill
end
