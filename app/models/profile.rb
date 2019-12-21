class Profile < ApplicationRecord
    belongs_to :user
    belongs_to :joblevel
    belongs_to :skill
    has_many :comments, dependent: :destroy

    #validates :email,  uniqueness: {message: '...já está em uso'}
    #validates :name, :address, :cellphone, :date_birth, presence: {message: '...deve ser informado'}
    #validates :name, length: { minimum: 5, message: '....deve ter tamanho minimo de 5 caracter'}

    enum languages: { "inglês(basico)": 0, "inglês(intermediario)": 15, "inglês(avançado)": 30}
    def set_default_languages
        self.languages ||= :"inglês(basico)"
    end

    enum education_level: { "fundamental": 0, "técnico": 15, "graduado": 30}
    def set_default_education_level
        self.education_level ||= :"graduado"
    end

    enum education_status: { "cursando": 0, "trancado": 15, "concluido": 30}
    def set_default_education_status
        self.education_status ||= :"concluido"
    end

    def completed_profile?
        self.name.present? && self.social_name.present? && self.address.present? && self.cellphone.present? && self.date_birth.present? && self.languages.present? && self.education_level.present? && self.education_status.present? && self.education_institution.present? && self.education_course.present? && self.education_end_date.present? && self.experience_company.present? && self.experience_reponsibility.present? && self.experience_role.present? && self.experience_start_date.present? && self.experience_end_date.present? && self.experience_current_position.present? 
    end

end

