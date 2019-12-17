class Company < ApplicationRecord
    has_many :job
    
    validates :name, :cnpj, :address, :description,  presence: {message: '...deve ser informado'}
    validates :name, :cnpj, uniqueness: {message: '...já está em uso'}
    validates :description, length: { minimum: 20, message: '....deve ter tamanho minimo de 20 caracter'}
end
