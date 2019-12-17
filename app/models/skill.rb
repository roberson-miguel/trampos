class Skill < ApplicationRecord
    validates :name, presence: {message: '...deve ser informado'}
    validates :name, uniqueness: {message: '...já está em uso'}
    validates :name, length: { minimum: 3, message: '....deve ter tamanho minimo de 3 caracter'}
end
