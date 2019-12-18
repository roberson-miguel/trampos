class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :joblevel
  belongs_to :skill

  #validates :name, presence: {message: '...deve ser informado'}

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
end