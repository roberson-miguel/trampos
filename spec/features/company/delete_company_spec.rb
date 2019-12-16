require "rails_helper"

feature 'delete a company' do
  scenario "..I must delete a company" do

    Company.create(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Faz vencedores')

    visit root_path
    click_link "Empresas"
    click_link "Campus Code"
    click_link "Deletar"

    expect(page).to have_content('Empresa excluida com sucesso')
  end
end