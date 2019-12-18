class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :joblevel
  belongs_to :skill

  #validates :name, presence: {message: '...deve ser informado'}
end
