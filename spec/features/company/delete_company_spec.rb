require "rails_helper"

feature 'delete a company' do
  scenario "..I must delete a company" do

    company = Company.create(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')

    head = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path

    login_as(head)

    click_link "Entrar"
    
    click_link "Empresas"
    click_link "Campus Code"
    click_link "Deletar"

    expect(page).to have_content('Empresa excluida com sucesso')
  end
end