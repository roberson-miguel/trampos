class Joblevel < ApplicationRecord
    has_many :jobs
    has_many :profiles
        
    validates :name, presence: {message: '...deve ser informado'}
    validates :name, uniqueness: {message: '...já está em uso'}
    validates :name, length: { minimum: 2, message: '....deve ter tamanho minimo de 2 caracter'}
end
