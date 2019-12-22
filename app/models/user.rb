class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:candidate, :headhunter]

  enum status: [:novoperfil, :andamento]

  #after_initialize :set_default_status, :if => :new_record?

  #def set_default_status
  #  self.status ||= :"novo"
  #end

  has_one :profile, dependent: :destroy
  has_many :jobs, dependent: :destroy


end
