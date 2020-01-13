class Profile < ApplicationRecord
    belongs_to :user
    belongs_to :joblevel
    belongs_to :skill
    has_many :comments, dependent: :destroy
    has_one_attached :avatar

    has_many :profilejobs, :dependent => :destroy
    has_many :jobs, :through => :profilejobs

    has_many :favorite_profiles
    has_many :favorited_by, through: :favorite_profiles, source: :user


    validates :name, :address, :cellphone, :date_birth, presence: {message: '...deve ser informado'}
    validates :name, length: { minimum: 5, message: '....deve ter tamanho minimo de 5 caracter'}

    enum languages: { "basic English": 0, "intermediary English": 15, "Advanced English": 30}
    def set_default_languages
        self.languages ||= :"basic English"
    end

    enum education_level: { "high school": 0, "technical": 15, "graduate": 30}
    def set_default_education_level
        self.education_level ||= :"graduate"
    end

    enum education_status: { "cursando": 0, "trancado": 15, "concluido": 30}
    def set_default_education_status
        self.education_status ||= :"concluido"
    end

end

